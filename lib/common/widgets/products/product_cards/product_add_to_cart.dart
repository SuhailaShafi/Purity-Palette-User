import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class ProductAddToCart extends StatelessWidget {
  const ProductAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        final cartItem = cartController.convertToCartItem(product, 1);
        cartController.addOneToCart(cartItem);
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0
                  ? SColors.primary
                  : SColors.backgroundDark,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SSizes.cardRadiusMd),
                  bottomRight: Radius.circular(SSizes.productImageRadius))),
          child: SizedBox(
            width: SSizes.lg * 1.2,
            height: SSizes.lg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: SColors.backgroundWhite),
                    )
                  : Icon(
                      Iconsax.add,
                      color: SColors.backgroundWhite,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
