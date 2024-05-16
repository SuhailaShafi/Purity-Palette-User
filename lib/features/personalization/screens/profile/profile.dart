import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/images/circular_image.dart';
import 'package:purity_pallette/common/widgets/loaders/shimmers/shimmer.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/personalization/controllers/user_controller.dart';
import 'package:purity_pallette/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:purity_pallette/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage =
                          controller.user.value.profilePictureUrl;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : SImages.userImage;
                      return controller.imageuploading.value
                          ? SShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : CircleImageWidget(
                              images: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(
                height: SSizes.spaceBtwnItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              const SSectionHeadingWidget(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              SProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullname,
                  onPressed: () => Get.to(() => ChangeName())),
              SProfileMenu(
                  title: 'Username',
                  value: controller.user.value.userName,
                  onPressed: () {}),
              const SizedBox(
                height: SSizes.spaceBtwnItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              const SSectionHeadingWidget(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              SProfileMenu(
                  title: 'Email',
                  value: controller.user.value.email,
                  onPressed: () {}),
              SProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              SProfileMenu(
                  title: 'Skin Type', value: 'Oily Skin', onPressed: () {}),
              SProfileMenu(
                  title: 'Hair Type', value: 'Silky Hair', onPressed: () {}),
              const SizedBox(
                height: SSizes.spaceBtwnItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              Center(
                  child: TextButton(
                onPressed: () => controller.deleteteAccountWarningPopup(),
                child: Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
