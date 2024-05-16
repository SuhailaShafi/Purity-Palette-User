import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/images/circular_image.dart';
import 'package:purity_pallette/common/widgets/images/s_rounded_image.dart';
import 'package:purity_pallette/common/widgets/texts/brand_name_with_verified_icon.dart';
import 'package:purity_pallette/common/widgets/texts/product__title.dart';
import 'package:purity_pallette/common/widgets/texts/product_price_text.dart';
import 'package:purity_pallette/features/shop/controllers/products/product_controller.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/constants/enums.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final darkmode = SHelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and Sale Price
        Row(
          children: [
            ///sale Tag
            CircularContainerWidget(
              radius: SSizes.sm,
              backgroundColor: Colors.yellow.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: SSizes.sm, vertical: SSizes.xs),
              child: offerPercentageWidget(
                  controller: controller, product: product),
            ),
            const SizedBox(width: SSizes.spaceBtwnItems),

            /// Price
            Row(
              children: [
                Text('${product.price}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(decoration: TextDecoration.lineThrough)),
              ],
            ),
            const SizedBox(width: SSizes.spaceBtwnItems),
            ProductPriceText(price: product.price.toString())
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwnItems / 1.5),

        ///Title
        Row(
          children: [
            SProductTitleText(title: product.productName),
            Text(
              '${product.quantity.toString()}ml',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwnItems / 1.5),

        /// Stock status
        Row(
          children: [
            const SProductTitleText(title: 'Status'),
            const SizedBox(width: SSizes.spaceBtwnItems / 1.5),
            Text(controller.getProductStockStatus(product.number),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: SSizes.spaceBtwnItems / 1.5),

        /// Brand
        Row(
          children: [
            CircleImageWidget(
              images: product.brand.imageUrl.toString(),
              width: 32,
              height: 32,
              isNetworkImage: true,
            ),
            BrandTitleWithVerifiedIcon(
              title: product.brand.name,
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}

class offerPercentageWidget extends StatelessWidget {
  const offerPercentageWidget({
    super.key,
    required this.controller,
    required this.product,
  });

  final ProductController controller;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: controller.fetchOfferPercentageByName(product.brand.name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
    );
  }
}
