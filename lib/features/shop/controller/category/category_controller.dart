import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

//
//initialize
  final isLoading = false.obs;

  Rx<CategoryType> selectedCategory = CategoryType.Hair.obs;
  RxList CategoriesList = [].obs;
  RxList proList = [].obs;
//

  void setSelectedCategory(CategoryType category) {
    selectedCategory.value = category;
  }

  @override
  void onInit() {
    fetchCategoryData(selectedCategory.value);
    super.onInit();
  }

  Future<void> fetchCategoryData(CategoryType selectedCategory) async {
    try {
      isLoading.value = true;
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot =
          await db.collection('categories').get();

      final List<Category> fetchedcatlist = querySnapshot.docs
          .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
          .where((category) => category.categoryType == selectedCategory)
          .toList();

      CategoriesList.assignAll(fetchedcatlist);
    } catch (e) {
      print('Error fetching hair category data: $e');
    } finally {
      isLoading.value = false;
    }
  }

//Load selected category data

//Get category or sub category products
  Future<List<ProductModel>> getCategoryProducts({
    required String category,
  }) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    Query query =
        db.collection('products').where('category', isEqualTo: category);

    final QuerySnapshot querySnapshot = await query.get();
    final List<ProductModel> fetchedProductList = querySnapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    proList.assignAll(fetchedProductList);
    print("......cat rolist is...${proList}");
    return fetchedProductList;
  }
}
