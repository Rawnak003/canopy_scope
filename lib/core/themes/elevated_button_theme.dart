import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppElevatedButtonTheme {
  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        backgroundColor: AppColor.themeColor,
        foregroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(color: AppColor.whiteColor, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}