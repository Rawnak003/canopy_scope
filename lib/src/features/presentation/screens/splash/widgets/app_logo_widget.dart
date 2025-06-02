import 'package:flutter/material.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/asset_path.dart';
import '../../../../../../core/constants/colors.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: AppSpacing.screenWidth(context) * 0.5,
        height: AppSpacing.screenWidth(context) * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.whiteColor,
        ),
        child: Image.asset(AssetPath.appLogoPng, fit: BoxFit.fill,),
      ),
    );
  }
}