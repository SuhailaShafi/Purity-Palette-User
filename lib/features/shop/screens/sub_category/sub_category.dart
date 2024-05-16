import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/images/circular_image.dart';
import 'package:purity_pallette/common/widgets/loaders/shimmers/vertical_product_shimmers.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/shop/controller/category/category_controller.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';
import 'package:purity_pallette/features/shop/screens/all_products/all_products.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen(
      {super.key, required this.categoryType, required this.img});
  final CategoryType categoryType;
  final String img;
  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = CategoryController.instance;
    categoryController.fetchCategoryData(categoryType);
    return Scaffold(
      appBar: SAppBar(
        title: Text(categoryType.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Expanded(
            child: Column(
              children: [
                CircleImageWidget(
                    images: img,
                    height: 70,
                    width: double.infinity,
                    applyradius: false),
                SizedBox(height: SSizes.spaceBtwnSections),
                //Sub categories

                SizedBox(
                  height: 200,
                  child: Obx(
                    () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: categoryController.CategoriesList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final Category subcat =
                              categoryController.CategoriesList[index];
                          print(
                              '..........${subcat.name.toString()}..........');
                          return FutureBuilder(
                              future: categoryController.getCategoryProducts(
                                  category: subcat.name.toString()),
                              builder: (context, snapshot) {
                                final loader = SVerticalProductShimmer();
                                final widget =
                                    SHelperFunction.checkMultiRecordState(
                                        snapshot: snapshot, loader: loader);
                                if (widget != null) return widget;
                                final products = snapshot.data!;
                                return Column(
                                  children: [
                                    SSectionHeadingWidget(
                                      title: subcat.name.toString(),
                                      onPressed: () => Get.to(() => AllProducts(
                                          title: subcat.name.toString(),
                                          futureMethod: categoryController
                                              .getCategoryProducts(
                                                  category:
                                                      subcat.name.toString()))),
                                    ),
                                    const SizedBox(
                                        height: SSizes.spaceBtwnItems),
                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                width: SSizes.spaceBtwnItems),
                                        itemBuilder: (context, index) =>
                                            ProductCardHorizontalWidget(
                                          product: products[index],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
