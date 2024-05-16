import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:purity_pallette/common/widgets/layout/category_gridview.dart';
import 'package:purity_pallette/features/shop/controller/category/category_controller.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';

class MakeuppCatList extends StatelessWidget {
  const MakeuppCatList({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    categoryController.fetchCategoryData(CategoryType.Makeup);
    return Obx(() => categoryController.CategoriesList.isNotEmpty
        ? CategoryGridView(
            cat: categoryController.CategoriesList,
          )
        : CircularProgressIndicator());
  }
}
