import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/layout/grid_layout.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:purity_pallette/features/shop/controllers/products/all_products_controlller.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SSortableProducts extends StatelessWidget {
  const SSortableProducts({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: ((value) {
            controller.sortProducts(value!);
          }),
          value: controller.selectSortOption.value,
          items: [
            'Name',
            'HigherPrice',
            'LowerPrice',
            'Newest',
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        SizedBox(height: SSizes.spaceBtwnSections),
        Obx(
          () => SGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => SProductCardVerticalWidget(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
