import 'package:canopy_coverage/core/constants/colors.dart';
import 'package:flutter/material.dart';


class AppTextTheme {
  static TextTheme get appTextTheme {
    return TextTheme(
      headlineMedium: TextStyle(
        color: AppColor.blackColor,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: AppColor.blackColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: AppColor.blackColor,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: AppColor.greyColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: AppColor.greyColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: AppColor.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColor.blackColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColor.blackColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}