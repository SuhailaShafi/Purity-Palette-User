import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/search_result.dart';
import 'package:purity_pallette/common/widgets/products/sortable/sortable_products.dart';
import 'package:purity_pallette/features/shop/controllers/products/all_products_controlller.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/shop/controllers/products/product_controller.dart';
import 'package:purity_pallette/features/shop/screens/all_products/all_products.dart';

class SearchContainerWidget extends StatelessWidget {
  const SearchContainerWidget({
    super.key,
    this.icon = Iconsax.search_normal,
    required this.text,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final TextEditingController searchController = TextEditingController();
    final productController = Get.put(AllProductsController());

    return Padding(
      padding: padding,
      child: Container(
        width: SHelperFunction.ScreenWidth(),
        padding: EdgeInsets.all(SSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? SColors.backgroundDark
                  : Colors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(SSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: SColors.textgrey) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: SColors.textgrey),
            SizedBox(width: SSizes.spaceBtwnItems),
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: text,
                  border: InputBorder.none,
                ),
                onSubmitted: (query) {
                  if (query.isNotEmpty) {
                    productController.searchProducts(query).then((products) {
                      Get.to(() => SearchResult(
                            title: 'Search Results',
                            products: products,
                          ));
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
