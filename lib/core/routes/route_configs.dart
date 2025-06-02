import 'package:get/get.dart';
import '../../src/features/presentation/screens/home/home_screen.dart';
import '../../src/features/presentation/screens/splash/splash_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
    ),
  ];
}