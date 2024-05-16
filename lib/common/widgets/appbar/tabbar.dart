import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/device/device_utility.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class STabBar extends StatelessWidget implements PreferredSizeWidget {
  const STabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorColor: SColors.primary,
      unselectedLabelColor: SColors.backgroundDark,
      labelColor: SHelperFunction.isDarkMode(context)
          ? SColors.backgroundWhite
          : SColors.primary,
      tabs: tabs,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
