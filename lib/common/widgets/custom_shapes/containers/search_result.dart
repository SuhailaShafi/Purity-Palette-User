import 'package:flutter/material.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/common/widgets/layout/grid_layout.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_card_vertical.dart';

class SearchResult extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  const SearchResult({
    Key? key,
    required this.title,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: products.isEmpty
          ? Center(child: Text('No products found'))
          : SGridLayout(
              itemCount: products.length,
              itemBuilder: (_, index) => SProductCardVerticalWidget(
                product: products[index],
              ),
            ),
    );
  }
}
