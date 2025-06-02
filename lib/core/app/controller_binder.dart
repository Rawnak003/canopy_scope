import 'package:get/get.dart';

import '../../src/features/presentation/screens/home/controller/home_nav_controller.dart';
import '../../src/features/presentation/screens/splash/controller/splash_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(HomeNavController());
  }
}