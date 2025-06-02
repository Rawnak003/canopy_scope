import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColor.getMaterialColor(AppColor.themeColor),
      ),
    );
  }
}