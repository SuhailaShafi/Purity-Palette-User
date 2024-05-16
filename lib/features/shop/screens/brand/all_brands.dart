import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/layout/grid_layout.dart';
import 'package:purity_pallette/common/widgets/products/brand/brand_card.dart';
import 'package:purity_pallette/common/widgets/products/sortable/sortable_products.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/shop/controllers/store_controller.dart';
import 'package:purity_pallette/features/shop/model/brands/brand_model.dart';
import 'package:purity_pallette/features/shop/screens/all_products/all_products.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BrandController brandController = BrandController.instance;
    return Scaffold(
      appBar: const SAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
              children: [
                //Heading
                SSectionHeadingWidget(title: 'Brands', showActionButton: false),
                const SizedBox(height: SSizes.spaceBtwnItems),
                //Brands
                SGridLayout(
                    itemCount: 4,
                    mainAxisExtend: 80,
                    itemBuilder: (context, index) {
                      BrandModel brand = brandController.brandsList[index];
                      return SBrandCard(
                        brand: brand,
                        showBorder: true,
                        onTap: () => Get.to(() => AllProducts(
                              title: brand.name,
                              futureMethod: brandController
                                  .getProductsByBrand(brand.name),
                            )),
                      );
                    })
              ],
            )),
      ),
    );
  }
}
