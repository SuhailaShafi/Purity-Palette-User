import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/personalization/screens/settings/settings.dart';
import 'package:purity_pallette/features/shop/screens/home/home.dart';
import 'package:purity_pallette/features/shop/screens/reels_review.dart';
import 'package:purity_pallette/features/shop/screens/store/store.dart';
import 'package:purity_pallette/features/shop/screens/wishlist/wishlist.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkmode = SHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selected.value,
          onDestinationSelected: (index) => controller.selected.value = index,
          indicatorColor: darkmode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          backgroundColor: darkmode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            //NavigationDestination(
            // icon: Icon(Iconsax.video_play), label: 'Review'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selected.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selected = 0.obs;
  final screens = [
    const HomeScreen(),
    const Store(),
    SettingsScreen(),
    FavouriteScreen(),
    //ReelsScreen()
  ];
}
