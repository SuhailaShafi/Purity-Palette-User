import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:purity_pallette/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:purity_pallette/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:purity_pallette/features/shop/screens/product_details/widgets/rating__widget.dart';
import 'package:purity_pallette/features/shop/screens/reviews/reviews.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: SBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1-product image slider
            SProductImageSlider(product: product),
            //2-Product Details/
            Padding(
              padding: const EdgeInsets.only(
                right: SSizes.defaultSpace,
                left: SSizes.defaultSpace,
                bottom: SSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // -- Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const SRatingWidget(), Icon(Icons.share)],
                  ),
                  const SizedBox(height: SSizes.spaceBtwnItems),
                  // -- Price,Title,stock,& brand
                  ProductMetadata(
                    product: product,
                  ),
                  const SizedBox(height: SSizes.spaceBtwnItems),
                  // --- Checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: SSizes.spaceBtwnItems),
                  // -- descrition
                  const SSectionHeadingWidget(title: 'description'),
                  const SizedBox(height: SSizes.spaceBtwnItems),
                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  // -- reviews
                  const Divider(),
                  const SizedBox(height: SSizes.spaceBtwnItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SSectionHeadingWidget(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () => Get.to(() => ProductReviewsScreen()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  SizedBox(height: SSizes.spaceBtwnItems)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
