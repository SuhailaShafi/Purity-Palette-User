import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/appbar/tabbar.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:purity_pallette/common/widgets/layout/brand_grid_layout.dart';
import 'package:purity_pallette/common/widgets/layout/grid_layout.dart';
import 'package:purity_pallette/common/widgets/products/brand/brand_card.dart';
import 'package:purity_pallette/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:purity_pallette/common/widgets/products/sortable/sortable_products.dart';
import 'package:purity_pallette/common/widgets/texts/brand_name_with_verified_icon.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/shop/controllers/products/product_controller.dart';
import 'package:purity_pallette/features/shop/controllers/store_controller.dart';
import 'package:purity_pallette/features/shop/model/brands/brand_model.dart';
import 'package:purity_pallette/features/shop/screens/all_products/all_products.dart';
import 'package:purity_pallette/features/shop/screens/brand/all_brands.dart';
import 'package:purity_pallette/features/shop/screens/brand/brand_products.dart';
import 'package:purity_pallette/features/shop/screens/store/widgets/hair_category_list.dart';
import 'package:purity_pallette/features/shop/screens/store/widgets/makeup_category_list.dart';
import 'package:purity_pallette/features/shop/screens/store/widgets/skin_category_list.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/enums.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final BrandController brandController = Get.put(BrandController());
    final controller = ProductController.instance;
    brandController.fetchBrandData();
    final brandList = brandController.brandsList;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: SAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              SCartCountIconWidget(
                IconColor: SColors.primary,
              )
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      floating: true,
                      backgroundColor: SHelperFunction.isDarkMode(context)
                          ? Colors.black
                          : Colors.white,
                      expandedHeight: 440,
                      flexibleSpace: Padding(
                        padding: const EdgeInsets.all(SSizes.defaultSpace),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const SizedBox(
                              height: SSizes.defaultSpace,
                            ),
                            const SearchContainerWidget(
                              text: 'Search in Store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwnSections,
                            ),

                            ///Featured brands-------------------------------
                            SSectionHeadingWidget(
                              title: 'Featured Brands',
                              showActionButton: true,
                              onPressed: () => Get.to(() => AllBrandsScreen()),
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwnItems / 2,
                            ),
                            //BrandGridLayout(),
                            FutureBuilder<List<BrandModel>>(
                              future: brandController
                                  .fetchBrandData(), // Replace with your actual data fetching function
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // While data is loading, show a loading indicator or placeholder
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  // If there's an error fetching data, display an error message
                                  return Text('Error: ${snapshot.error}');
                                } else if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty) {
                                  // If data is loaded successfully and brandList is not empty, render the SGridLayout
                                  return SGridLayout(
                                    itemCount: snapshot.data!.length,
                                    mainAxisExtend: 80,
                                    itemBuilder: (_, index) {
                                      BrandModel brand = snapshot.data![index];
                                      print(
                                          '----------------brand imagr is ${brand.imageUrl}');
                                      return SBrandCard(
                                        brand: brand,
                                        showBorder: true,
                                        onTap: () => Get.to(() => AllProducts(
                                              title: brand.name,
                                              futureMethod: brandController
                                                  .getProductsByBrand(
                                                      brand.name),
                                            )),
                                      );
                                    },
                                  );
                                } else {
                                  // If brandList is empty, display a message indicating no data
                                  return Text('No brands found.');
                                }
                              },
                            )
                          ],
                        ),
                      ),
                      bottom: STabBar(
                        tabs: [
                          const Tab(child: Text('Makeup')),
                          const Tab(child: Text('Skin')),
                          const Tab(child: Text('Hair'))
                        ],
                      ))
                ];
              },
              body: TabBarView(children: [
                MakeuppCatList(),
                HairCatList(),
                SkinCatList(),
              ]))),
    );
  }
}
