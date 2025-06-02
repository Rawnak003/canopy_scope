import 'package:flutter/material.dart';

import '../../../../../core/app/app_spacing.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/routes/route_names.dart';
import '../../widgets/screen_background.dart';
import 'widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _onTapGetStarted() {
    Navigator.pushReplacementNamed(context, RouteName.home);
  }

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
                onPressed: _onTapGetStarted,
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
