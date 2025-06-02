import 'package:get/get.dart';

import '../../../../../../core/routes/route_names.dart';

class SplashController extends GetxController {
  void onTapGetStarted() {
    Get.offNamed(RouteName.home);
  }
}
