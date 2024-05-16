import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/images/circular_image.dart';
import 'package:purity_pallette/features/personalization/controllers/user_controller.dart';
import 'package:purity_pallette/features/personalization/screens/profile/profile.dart';
import 'package:purity_pallette/utils/constants/colors.dart';

import '../../../features/shop/screens/store/store.dart';

class SUserProfileTile extends StatelessWidget {
  const SUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: CircleImageWidget(
        images: controller.user.value.profilePictureUrl,
        width: 50,
        height: 50,
        padding: 0,
        isNetworkImage: true,
      ),
      title: Text(
        controller.user.value.fullname,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: SColors.backgroundWhite),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: SColors.backgroundWhite),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(() => ProfileScreen()),
          icon: const Icon(Iconsax.edit, color: SColors.backgroundWhite)),
    );
  }
}
