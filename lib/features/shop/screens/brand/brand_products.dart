import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/products/brand/brand_card.dart';
import 'package:purity_pallette/common/widgets/products/sortable/sortable_products.dart';
import 'package:purity_pallette/features/shop/controllers/store_controller.dart';
import 'package:purity_pallette/features/shop/model/brands/brand_model.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final BrandController controller = BrandController.instance;
    final products = controller.getProductsByBrand(brand.name);
    return Scaffold(
        appBar: SAppBar(title: Text(brand.name)),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
              children: [
                //BrandDetails
                SBrandCard(showBorder: true, brand: brand),
                SizedBox(
                  height: SSizes.spaceBtwnSections,
                ),
                SSortableProducts(
                  products: [],
                ),
              ],
            ),
          ),
        ));
  }
}
