import 'package:canopy_coverage/src/features/presentation/screens/capture_screen/controller/capture_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';

class ImagePreviewWidget extends StatelessWidget {
  const ImagePreviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CaptureScreenController>(
      builder: (controller) {
        return Container(
          width: AppSpacing.screenWidth(context) * 0.7,
          height: AppSpacing.screenHeight(context) * 0.6,
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: AppColor.themeColor),
            borderRadius: BorderRadius.circular(10),
            color: AppColor.whiteColor,
          ),
          child: controller.capturedImage == null
              ? Icon(Icons.add_a_photo_outlined, size: AppSpacing.screenWidth(context) * 0.2,
            color: AppColor.themeColor,)
              : Image.file(controller.capturedImage!, fit: BoxFit.contain),
        );
      }
    );
  }
}