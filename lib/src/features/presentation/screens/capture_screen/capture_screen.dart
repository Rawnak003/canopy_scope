import 'package:canopy_coverage/src/features/presentation/screens/capture_screen/controller/capture_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app/app_spacing.dart';
import '../../../../../core/constants/strings.dart';
import '../../common_widgets/screen_background.dart';
import 'widgets/image_preview_widget.dart';

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {

    CaptureScreenController captureScreenController = Get.find<CaptureScreenController>();

    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.camera)),
      body: SafeArea(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.pagePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImagePreviewWidget(),
                SizedBox(height: AppSpacing.screenHeight(context) * 0.1),
                GetBuilder<CaptureScreenController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.captureInProgress == false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: captureScreenController.captureImage,
                        child: Text(AppStrings.capturePhoto),
                      ),
                    );
                  }
                ),
                SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                GetBuilder<CaptureScreenController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.processingInProgress == false,
                        replacement: const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                          onPressed: captureScreenController.showLoadingAndProceed,
                          child: Text(AppStrings.proceedToNextScreen),
                        ),
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}