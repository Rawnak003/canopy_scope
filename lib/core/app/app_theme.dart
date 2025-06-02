import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../themes/elevated_button_theme.dart';
import '../themes/text_theme.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColor.getMaterialColor(AppColor.themeColor),
      ),
      elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonTheme,
      textTheme: AppTextTheme.appTextTheme,
    );
  }
}