import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/loaders/shimmers/shimmer.dart';
import 'package:purity_pallette/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:purity_pallette/features/personalization/controllers/user_controller.dart';
import 'package:purity_pallette/utils/constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good Day for Shopping',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: SColors.textgrey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const SShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullname,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: SColors.backgroundWhite));
            }
          }),
        ],
      ),
      actions: [
        SCartCountIconWidget(
          IconColor: SColors.backgroundWhite,
        )
      ],
    );
  }
}
