import 'package:get/get.dart';

import '../../../../../../core/routes/route_names.dart';

class HomeNavController extends GetxController {
  void onTapCamera() {
    Get.toNamed(RouteName.camera);
  }
  void onTapGallery() {}
  void onTapHistory() {}
  void onTapAboutUs() {}
}