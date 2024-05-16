import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/layout/category_gridview.dart';
import 'package:purity_pallette/features/shop/controller/category/category_controller.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';

class HairCatList extends StatelessWidget {
  const HairCatList({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    categoryController.fetchCategoryData(CategoryType.Hair);
    return Obx(() => categoryController.CategoriesList.isNotEmpty
        ? CategoryGridView(
            cat: categoryController.CategoriesList,
          )
        : CircularProgressIndicator()); // Show loading indicator if data is not yet fetched
  }
}
