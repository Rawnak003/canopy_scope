import 'package:flutter/material.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';

class ImagePreviewWidget extends StatelessWidget {
  const ImagePreviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.screenWidth(context) * 0.8,
      height: AppSpacing.screenWidth(context) * 0.8,
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: AppColor.themeColor),
        borderRadius: BorderRadius.circular(10),
        color: AppColor.whiteColor,
      ),
      child: Icon(
        Icons.add_a_photo_outlined,
        size: AppSpacing.screenWidth(context) * 0.2,
        color: AppColor.themeColor,
      ),
    );
  }
}