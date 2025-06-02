import 'dart:io';

import 'package:canopy_coverage/src/features/data/models/canopy_entry_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../core/routes/route_names.dart';
import '../../../../data/services/image_processing_service.dart';
import '../../../../data/services/location_service.dart';

class CaptureScreenController extends GetxController {
  bool _captureInProgress = false;

  bool get captureInProgress => _captureInProgress;

  final ImagePicker _picker = ImagePicker();
  late CanopyEntryModel entry;

  Future<void> captureImage() async {
    _captureInProgress = true;
    update();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final imageFile = await File(image.path).copy(path);

    // final coverage = await ImageProcessingService().calculateCanopyCoverage(imageFile.path);
    // final location = await LocationService().getLocation();

    // entry = CanopyEntryModel(
    //   imagePath: imageFile.path,
    //   coverage: coverage,
    //   latitude: location.latitude,
    //   longitude: location.longitude,
    //   timestamp: DateTime.now(),
    // );
    _captureInProgress = false;
    update();
    Get.toNamed(RouteName.result);
  }


  void proceedToNextScreen() {
    _captureInProgress = false;
    update();
    Get.toNamed(RouteName.result);
  }
}