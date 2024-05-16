import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:purity_pallette/common/widgets/images/s_rounded_image.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:purity_pallette/features/shop/controllers/home_controller.dart';
import 'package:purity_pallette/features/shop/controllers/store_controller.dart';
import 'package:purity_pallette/features/shop/screens/all_products/all_products.dart';
import 'package:purity_pallette/features/shop/screens/brand/brand_products.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SPromoSliderWidget extends StatelessWidget {
  const SPromoSliderWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController.instance;
    BrandController brandcontroller = Get.put(BrandController());
    return FutureBuilder<void>(
      future: controller.fetchOfferData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          print(controller.offerList.length);
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
                items: controller.offerList.map((offer) {
                  return SRoundedImageWidget(
                    onPressed: () => Get.to(() => AllProducts(
                          title: offer.brand.name,
                          futureMethod: brandcontroller
                              .getProductsByBrand(offer.brand.name),
                        )),
                    imageUrl: offer.image,
                    width: double.infinity,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.offerList.length; i++)
                      CircularContainerWidget(
                        width: 20,
                        height: 4,
                        margin: EdgeInsets.only(right: 10),
                        backgroundColor: controller.carousalCurrentIndex == i
                            ? SColors.primary
                            : SColors.backgroundPurple,
                      ),
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }
}
