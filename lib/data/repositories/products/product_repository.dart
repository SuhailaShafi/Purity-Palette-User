import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
//firestore instance for databas interactions
  final _db = FirebaseFirestore.instance;
//get limited roducts
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      print('product fetching');
      final snapshot = await _db.collection("products").limit(3).get();
      //.where('applicable', isEqualTo: "abc")
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      print('product fetching');
      final snapshot = await _db.collection("products").get();
      //.where('applicable', isEqualTo: "abc")
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      print('product fetching');
      final querySnapshot = await query.get();
      //.where('applicable', isEqualTo: "abc")
      List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
