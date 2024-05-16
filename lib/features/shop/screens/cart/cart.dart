import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/loaders/animation__loader.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:purity_pallette/features/shop/screens/checkout/checkout.dart';
import 'package:purity_pallette/navigation_menu.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(() {
        final emptyWidget = SAnimationLoaderWidget(
          text: "Woops cart is Empty",
          animation: SImages.SAnimationImage,
          showAction: true,
          actionText: 'Lets add some',
          onActionPressed: () => Get.off(() => NavigationMenu()),
        );
        return controller.cartItems.isEmpty
            ? emptyWidget
            : SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(SSizes.defaultSpace),
                    child: SCartItems()));
      }),
      bottomNavigationBar: Obx(
        () => controller.cartItems.isEmpty
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.all(SSizes.defaultSpace),
                child: ElevatedButton(
                    onPressed: () => Get.to(() => CheckoutScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Checkout'),
                        Icon(Icons.currency_rupee),
                        Text('${controller.totalCartPrice}'),
                      ],
                    )),
              ),
      ),
    );
  }
}
