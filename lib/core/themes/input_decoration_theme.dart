import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppInputDecoration {
  static InputDecorationTheme get inputDecoration {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: _getOutlineInputBorder(),
      enabledBorder: _getOutlineInputBorder(),
      focusedBorder: _getOutlineInputBorder(),
      errorBorder: _getOutlineInputBorder(),
      hintStyle: TextStyle(
        color: AppColor.greyColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static OutlineInputBorder _getOutlineInputBorder(){
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColor.themeColor,
        width: 1,
      ),
    );
  }
}