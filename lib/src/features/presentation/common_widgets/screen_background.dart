import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.secondaryColor,
                  AppColor.whiteColor,
                ],
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
