import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/strings.dart';
import '../routes/route_configs.dart';
import '../routes/route_names.dart';
import 'app_theme.dart';
import 'controller_binder.dart';

class CanopyScope extends StatelessWidget {
  const CanopyScope({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      getPages: AppRoutes.routes,
      theme: AppTheme.lightThemeData,
      initialBinding: ControllerBinder(),
    );
  }
}
