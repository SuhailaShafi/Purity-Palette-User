import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/loaders/animation__loader.dart';
import 'package:purity_pallette/features/shop/controllers/order_controller.dart';
import 'package:purity_pallette/navigation_menu.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SOrdersList extends StatelessWidget {
  const SOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = SHelperFunction.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          final emptyWidget = SAnimationLoaderWidget(
            text: "Whoops ! no orders yet",
            animation: SImages.SAnimationImage,
            showAction: true,
            actionText: "Let\'s fill it",
            onActionPressed: () => Get.off(() => NavigationMenu()),
          );
          final response = SHelperFunction.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;
          final orders = snapshot.data!;
          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: SSizes.spaceBtwnItems),
              itemBuilder: (_, index) {
                final order = orders[index];
                return CircularContainerWidget(
                  showBorder: true,
                  padding: EdgeInsets.all(SSizes.md),
                  backgroundColor: dark
                      ? SColors.backgroundDark
                      : Color.fromARGB(255, 247, 239, 239),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.ship),
                          SizedBox(
                            width: SSizes.spaceBtwnItems / 2,
                          ),
                          //status and date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.orderStatusText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: SColors.primary,
                                          fontWeightDelta: 1),
                                ),
                                Text(
                                  order.orderDate.toString(),
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Iconsax.arrow_right_34,
                                size: SSizes.icsm,
                              ))
                        ],
                      ),
                      SizedBox(height: SSizes.spaceBtwnItems),

                      //Row2
                      Row(children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Iconsax.tag),
                              SizedBox(
                                width: SSizes.spaceBtwnItems / 2,
                              ),
                              //status and date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: SColors.backgroundDark,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(
                                      order.id,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Iconsax.calendar),
                              SizedBox(
                                width: SSizes.spaceBtwnItems / 2,
                              ),
                              //status and date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shipping Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: SColors.backgroundDark,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(
                                      order.deliveryDate.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ])
                    ],
                  ),
                );
              });
        });
  }
}
