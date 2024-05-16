import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/shop/model/brands/brand_model.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();
  RxList brandsList = [].obs;
  // Save category data to Firebase Firestore

  Future<List<BrandModel>> fetchBrandData() async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot = await db.collection('brands').get();

      final List<BrandModel> fetchedbrandlist = querySnapshot.docs
          .map((doc) => BrandModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      brandsList.assignAll(fetchedbrandlist);
      print('brandslist$brandsList'); // Print before returning data
      print('brands data fetched successfully!');
      return fetchedbrandlist; // Return the fetched brand list
    } catch (e) {
      print('Error fetching brands data: $e');
      throw e; // Rethrow the error after printing
    }
  }

  Future<int> getBrandProductCount(String brand) async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot = await db
          .collection('products')
          .where('brand', isEqualTo: brand)
          .get();

      return querySnapshot.size;
    } catch (e) {
      print('Error fetching product count: $e');
      return 0; // Return 0 in case of error
    }
  }

  Future<List<ProductModel>> getProductsByBrand(String brand) async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot = await db
          .collection('products')
          .where('brand', isEqualTo: brand)
          .get();

      final List<ProductModel> products = querySnapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return products;
    } catch (e) {
      print('Error fetching products by brand: $e');
      return []; // Return an empty list in case of error
    }
  }
}
