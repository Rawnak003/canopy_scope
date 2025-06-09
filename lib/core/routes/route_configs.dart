import 'package:get/get.dart';
import '../../src/features/presentation/screens/capture_screen/capture_screen.dart';
import '../../src/features/presentation/screens/home_screen/home_screen.dart';
import '../../src/features/presentation/screens/result_screen/result_screen.dart';
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
    GetPage(
      name: RouteName.camera,
      page: () => const CaptureScreen(),
    ),
    GetPage(
      name: RouteName.result,
      page: () => ResultScreen(entry: Get.arguments),
    ),
  ];
}