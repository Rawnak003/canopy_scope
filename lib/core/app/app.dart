import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../routes/route_configs.dart';
import '../routes/route_names.dart';
import 'app_theme.dart';

class CanopyScope extends StatelessWidget {
  const CanopyScope({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      onGenerateRoute: RouteConfigs.generateRoute,
      theme: AppTheme.lightThemeData,
    );
  }
}
