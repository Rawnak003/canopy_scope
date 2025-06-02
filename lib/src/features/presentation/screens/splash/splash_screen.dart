import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app/app_spacing.dart';
import '../../../../../core/constants/strings.dart';
import '../../common_widgets/screen_background.dart';
import 'controller/splash_controller.dart';
import 'widgets/app_logo_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppSpacing.screenHeight(context) * 0.1),
              AppLogoWidget(),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.4),
              ElevatedButton(
                onPressed: Get.find<SplashController>().onTapGetStarted,
                child: Text(AppStrings.getStarted),
              ),
              Spacer(),
              Text(
                AppStrings.appVersion,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: AppSpacing.screenHeight(context) * 0.001),
            ],
          ),
        ),
      ),
    );
  }
}
