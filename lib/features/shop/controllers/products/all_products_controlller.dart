import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/data/repositories/products/product_repository.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/popup/full_screen_loader.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();
  final repository = ProductRepository.instance;
  final RxString selectSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  Future<List<ProductModel>> FetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductByQuery(query);
      return products;
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectSortOption.value = sortOption;
    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.productName.compareTo(b.productName));
        break;
      case 'HigherPrice':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'LowerPrice':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a, b) => b.id.compareTo(a.id));
        break;
      default:
        products.sort((a, b) => a.productName.compareTo(b.productName));
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Name');
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    SFullScreenLoader.openLoadingDialog('Searching', SImages.SAnimationImage);
    try {
      final products = await repository.searchProducts(query);
      return products;
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    } finally {
      SFullScreenLoader.stopLoaduing();
    }
  }
}
