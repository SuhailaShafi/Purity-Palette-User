import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/loaders/shimmers/vertical_product_shimmers.dart';
import 'package:purity_pallette/common/widgets/products/sortable/sortable_products.dart';
import 'package:purity_pallette/features/shop/controllers/products/all_products_controlller.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: SAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.FetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = SVerticalProductShimmer();
                final widget = SHelperFunction.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;
                final products = snapshot.data!;
                return SSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
