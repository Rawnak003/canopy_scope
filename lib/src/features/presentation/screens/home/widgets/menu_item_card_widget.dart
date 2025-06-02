import 'package:flutter/material.dart';

import '../../../../../../core/app/app_spacing.dart';
import '../../../../../../core/constants/colors.dart';

class MenuItemCardWidget extends StatelessWidget {
  const MenuItemCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: AppSpacing.pagePadding),
        elevation: 8,
        child: Container(
          width: AppSpacing.screenWidth(context),
          height: AppSpacing.screenHeight(context) * 0.13,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: ListTile(
              leading: Icon(iconData, color: AppColor.themeColor, size: 50),
              title: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: Text(
                subtitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.themeColor,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
