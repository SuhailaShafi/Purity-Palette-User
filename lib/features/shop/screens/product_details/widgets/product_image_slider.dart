import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:purity_pallette/common/widgets/icon/circular_icon.dart';
import 'package:purity_pallette/common/widgets/images/s_rounded_image.dart';
import 'package:purity_pallette/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:purity_pallette/features/shop/controllers/products/image_controller.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SProductImageSlider extends StatelessWidget {
  const SProductImageSlider({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      color: dark ? SColors.backgroundDark : SColors.backgroundWhite,
      child: Stack(
        children: [
          SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(SSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: SColors.primary),
                    ),
                  );
                })),
              )),

          //Image Slider
          Positioned(
            right: 0,
            bottom: 30,
            left: SSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(
                        width: SSizes.spaceBtwnItems,
                      ),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                        final imageSelected =
                            controller.selectedProductImage.value ==
                                images[index];
                        return SRoundedImageWidget(
                          imageUrl: images[index],
                          width: 80,
                          onPressed: () => controller
                              .selectedProductImage.value = images[index],
                          isnetworkImage: true,
                          backgroundColor: dark
                              ? SColors.backgroundDark
                              : SColors.backgroundWhite,
                          border: Border.all(
                              color: imageSelected
                                  ? SColors.primary
                                  : Colors.transparent),
                          padding: EdgeInsets.all(SSizes.sm),
                        );
                      })),
            ),
          ),
          //Appbar Icons
          SAppBar(
            showBackArrow: true,
            actions: [SFavouriteIcon(productId: product.id,)],
          )
        ],
      ),
    );
  }
}
