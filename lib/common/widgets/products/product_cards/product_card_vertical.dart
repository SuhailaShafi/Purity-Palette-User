import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/styles/shadows.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/icon/circular_icon.dart';
import 'package:purity_pallette/common/widgets/images/s_rounded_image.dart';
import 'package:purity_pallette/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_add_to_cart.dart';
import 'package:purity_pallette/common/widgets/texts/brand_name_with_verified_icon.dart';
import 'package:purity_pallette/common/widgets/texts/product__title.dart';
import 'package:purity_pallette/common/widgets/texts/product_price_text.dart';
import 'package:purity_pallette/features/shop/controllers/products/product_controller.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/features/shop/screens/product_details/product_details.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SProductCardVerticalWidget extends StatelessWidget {
  const SProductCardVerticalWidget({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final bool dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SSizes.productImageRadius),
          color: dark ? SColors.backgroundDark : SColors.backgroundWhite,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            ///thumbnail, wishlist button, discount Tag
            CircularContainerWidget(
              height: 180,
              padding: const EdgeInsets.all(SSizes.sm),
              backgroundColor:
                  dark ? SColors.backgroundDark : SColors.backgroundWhite,
              child: Stack(
                children: [
                  //thumbnail image
                  SRoundedImageWidget(
                      height: 180,
                      imageUrl: product.image1.toString(),
                      applyImageRadius: true),

                  //saletag
                  Positioned(
                    top: 12,
                    child: CircularContainerWidget(
                      radius: SSizes.sm,
                      backgroundColor: Colors.yellow.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: SSizes.sm, vertical: SSizes.xs),
                      child: FutureBuilder<String?>(
                        future: controller
                            .fetchOfferPercentageByName(product.brand.name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Show a loading indicator while fetching data
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Text(
                              '${snapshot.data}%' ??
                                  '0%', // Show offer percentage or a default message
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(color: Colors.black),
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  ///---Favourite IconButton
                  Positioned(
                      top: 0,
                      right: 0,
                      child: SFavouriteIcon(
                        productId: product.id,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: SSizes.spaceBtwnItems / 2,
            ),

            ///----Details
            Padding(
              padding: const EdgeInsets.only(left: SSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SProductTitleText(
                    title: product.productName,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwnItems / 2,
                  ),
                  BrandTitleWithVerifiedIcon(
                    title: product.brand.name,
                  ),
                  //Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: SSizes.sm),
                        child: ProductPriceText(
                          price: product.price.toString(),
                        ),
                      ),
                      ProductAddToCart(
                        product: product,
                      )
                    ],
                  )
                ],
              ),
            )

            ///details
          ]),
        ),
      ),
    );
  }
}
