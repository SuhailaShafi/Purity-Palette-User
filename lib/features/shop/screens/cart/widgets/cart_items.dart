import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:purity_pallette/common/widgets/products/cart/cart_item.dart';
import 'package:purity_pallette/common/widgets/texts/product_price_text.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/features/shop/screens/cart/widgets/add_remove_button.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SCartItems extends StatelessWidget {
  const SCartItems({super.key, this.showAddRemoveItems = true});
  final bool showAddRemoveItems;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
        itemCount: controller.cartItems.length,
        shrinkWrap: true,
        separatorBuilder: (_, __) => SizedBox(
          height: SSizes.spaceBtwnSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = controller.cartItems[index];
          return Column(
            children: [
              SCartItem(cartItem: item),
              if (showAddRemoveItems) SizedBox(height: SSizes.spaceBtwnItems),
              if (showAddRemoveItems)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddRemoveButton(
                      quantity: item.number,
                      add: () => controller.addOneToCart(item),
                      remove: () => controller.removeOneFromCart(item),
                    ),
                    ProductPriceText(
                      price: (item.price * item.number).toStringAsFixed(1),
                    ),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
