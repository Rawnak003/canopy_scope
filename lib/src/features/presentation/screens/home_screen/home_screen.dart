import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app/app_spacing.dart';
import '../../../../../core/constants/strings.dart';
import '../../common_widgets/screen_background.dart';
import 'controller/home_nav_controller.dart';
import 'widgets/menu_item_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.home)),
      body: SafeArea(
        child: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.pagePadding),
            child: _buildMenu(),
          ),
        ),
      ),
    );
  }

  Widget _buildMenu() {
    HomeNavController homeController = Get.put(HomeNavController());
    return Column(
      children: [
        MenuItemCardWidget(
          title: AppStrings.camera,
          subtitle: AppStrings.takePhoto,
          iconData: Icons.camera_alt,
          onTap: homeController.onTapCamera,
        ),
        MenuItemCardWidget(
          title: AppStrings.gallery,
          subtitle: AppStrings.chooseFromGallery,
          iconData: Icons.folder_copy,
          onTap: homeController.onTapGallery,
        ),
        MenuItemCardWidget(
          title: AppStrings.history,
          subtitle: AppStrings.viewHistory,
          iconData: Icons.history,
          onTap: homeController.onTapHistory,
        ),
        MenuItemCardWidget(
          title: AppStrings.aboutUs,
          subtitle: AppStrings.viewAboutUs,
          iconData: Icons.info,
          onTap: homeController.onTapAboutUs,
        ),
      ],
    );
  }
}