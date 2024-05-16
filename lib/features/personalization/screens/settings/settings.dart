import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/primary__header_container.dart';
import 'package:purity_pallette/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:purity_pallette/common/widgets/list_tile/user_profile_listTile.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/personalization/screens/address/addresses.dart';
import 'package:purity_pallette/features/shop/screens/cart/cart.dart';
import 'package:purity_pallette/features/shop/screens/order/order.dart';
import 'package:purity_pallette/features/shop/screens/store/store.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            PrimaryHeaderContainerWidget(
                child: Column(
              children: [
                SAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: SSizes.spaceBtwnItems,
                ),

                ///userProfile----------------------------------------------------------------
                const SUserProfileTile(),
                const SizedBox(height: SSizes.spaceBtwnSections)
              ],
            )),

            ///Body
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account settings

                  const SSectionHeadingWidget(title: 'Account Settings'),
                  const SizedBox(
                    height: SSizes.spaceBtwnItems,
                  ),
                  SSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subtitle: 'Set Shopping delivery address',
                      ontap: () => Get.to(() => UserAddressesScreen())),
                  SSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'Add remove, products and move to checkout',
                      ontap: () => Get.to(() => CartScreen())),
                  SSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My orders',
                      subtitle: 'In-progress and completed orders',
                      ontap: () => Get.to(() => OrderScreen())),
                  SSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'withdraw balance to registered bank account',
                      ontap: () {}),
                  SSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subtitle: 'List of all the discount coupons',
                      ontap: () {}),
                  SSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message',
                      ontap: () {}),
                  SSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected account',
                      ontap: () {}),

                  //app settings
                  SizedBox(height: SSizes.spaceBtwnItems),
                  SSectionHeadingWidget(
                      title: 'App Settings', showActionButton: false),
                  SizedBox(height: SSizes.spaceBtwnItems),
                  SSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload data to your cloud firebase'),
                  SSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set reccommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result in safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD image quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
