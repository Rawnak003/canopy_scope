import 'dart:async';
import 'dart:io';
import 'package:canopy_coverage/src/features/data/models/canopy_entry_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../core/routes/route_names.dart';
import '../../../../data/services/image_processing_service.dart';
import '../../../../data/services/location_service.dart';

class CaptureScreenController extends GetxController {
  File? capturedImage;
  bool captureInProgress = false;
  bool processingInProgress = false;

  Future<void> captureImage() async {
    try {
      captureInProgress = true;
      update();

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85, // reduce size without major loss
      );

      if (pickedFile != null) {
        final dir = await getApplicationDocumentsDirectory();
        final newPath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
        final savedFile = await File(pickedFile.path).copy(newPath);
        capturedImage = savedFile;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to capture image: \$e');
    } finally {
      captureInProgress = false;
      update();
    }
  }

  Future<void> proceedToNextScreen() async {
    if (capturedImage == null) {
      Get.snackbar('Error', 'Please capture an image first');
      return;
    }

    try {
      processingInProgress = true;
      update();

      final coverage = await ImageProcessingService()
          .calculateCanopyCoverage(capturedImage!.path)
          .timeout(const Duration(seconds: 10)); // Add timeout

      if (coverage == 0.0) {
        throw Exception('Image processing returned invalid result');
      }

      final location = await LocationService().getCurrentLocation();

      final entry = CanopyEntryModel(
        imagePath: capturedImage!.path,
        coverage: coverage,
        latitude: location.latitude,
        longitude: location.longitude,
        timestamp: DateTime.now(),
      );

      Get.toNamed(RouteName.result, arguments: entry);
    } on TimeoutException {
      Get.snackbar('Error', 'Processing timed out');
    } catch (e) {
      Get.snackbar('Error', 'Processing failed: ${e.toString()}');
    } finally {
      processingInProgress = false;
      update();
    }
  }
}