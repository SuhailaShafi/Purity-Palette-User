import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/primary__header_container.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:purity_pallette/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:purity_pallette/common/widgets/layout/grid_layout.dart';
import 'package:purity_pallette/common/widgets/loaders/shimmers/vertical_product_shimmers.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/shop/controller/category/category_controller.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/features/shop/controllers/home_controller.dart';
import 'package:purity_pallette/features/shop/controllers/products/product_controller.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';
import 'package:purity_pallette/features/shop/screens/all_products/all_products.dart';
import 'package:purity_pallette/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:purity_pallette/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:purity_pallette/features/shop/screens/store/widgets/category_list.dart';
import 'package:purity_pallette/features/shop/screens/sub_category/sub_category.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final hmcontroller = Get.put(HomeController());
    final cartcontroller = Get.put(CartController());
    final categoryController = Get.put(CategoryController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryHeaderContainerWidget(
              child: Column(
                children: [
                  //appbar
                  const HomeAppBar(),
                  const SizedBox(
                    height: SSizes.spaceBtwnSections,
                  ),

                  //Searchbar
                  const SearchContainerWidget(
                    text: 'Search in Store',
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwnItems,
                  ),
                  //categories
                  Padding(
                    padding: const EdgeInsets.only(left: SSizes.defaultSpace),
                    child: Column(
                      children: [
                        //heading
                        const SizedBox(height: SSizes.spaceBtwnItems),
                        const SSectionHeadingWidget(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: SSizes.spaceBtwnItems),

                        //Categories
                        SizedBox(
                          height: 80,
                          child: // Inside the ListView.builder in the HomeScreen
                              ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              CategoryType cat;
                              String categoryType;
                              String imageasset;
                              // Set the categoryType based on the index
                              switch (index) {
                                case 0:
                                  categoryType = 'Hair';
                                  cat = CategoryType.Hair;
                                  imageasset = 'assets/images/hair.jpg';
                                  break;
                                case 1:
                                  categoryType = 'Makeup';
                                  cat = CategoryType.Makeup;
                                  imageasset = 'assets/images/lipcare.jpeg';
                                  break;
                                case 2:
                                  categoryType = 'Skin';
                                  cat = CategoryType.Skin;
                                  imageasset = 'assets/images/cleansers.jpeg';
                                  break;
                                default:
                                  categoryType = 'Other';
                                  cat = CategoryType.Hair;
                                  imageasset = SImages.onboardingOne;
                                  break;
                              }
                              return SVerticalImageTextWidget(
                                image: imageasset,
                                categoryType:
                                    categoryType, // Pass categoryType instead of title
                                onTap: () => Get.to(() => AllProducts(
                                      title: categoryType,
                                      futureMethod:
                                          controller.fetchProductData(cat),
                                    )),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwnSections,
                  ),
                ],
              ),
            ),

            //Body part
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Whats hot on the palette?',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.start),
                  Text(
                    'crazy deals time',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(SSizes.defaultSpace),
                    child: SPromoSliderWidget(),
                  ),
                  SizedBox(
                    height: SSizes.spaceBtwnSections,
                  ),

                  ///--------Heading----
                  SSectionHeadingWidget(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Popular Products ',
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                    showActionButton: true,
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwnItems,
                  ),
                  Obx(() {
                    if (controller.isLoading.value)
                      return SVerticalProductShimmer();
                    if (controller.featured.isEmpty) {
                      return Center(
                          child: Text(
                        'No data found',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ));
                    }
                    return SGridLayout(
                      itemCount: controller.featured.length,
                      itemBuilder: (_, index) => SProductCardVerticalWidget(
                        product: controller.featured[index],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
