import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purity_pallette/data/repositories/products/product_repository.dart';
import 'package:purity_pallette/features/shop/controllers/home_controller.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final productRepository = Get.put(ProductRepository());
  final isLoading = false.obs;
  RxList<ProductModel> featured = <ProductModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProducts();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      //fetch products
      final products = await productRepository.getFeaturedProducts();
      //Assign products
      featured.assignAll(products);
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      //fetch products
      final products = await productRepository.getAllFeaturedProducts();
      return products;
      //Assign products
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  Future<String?> fetchOfferPercentage(String brandId) async {
    try {
      final brandRef =
          FirebaseFirestore.instance.collection('offers').doc(brandId);
      final offerDoc = await brandRef.get();
      if (offerDoc.exists) {
        return offerDoc['percentage'] as String?;
      } else {
        print('No offer found for the brand with ID: $brandId');
        return null;
      }
    } catch (e) {
      print('Error fetching offer percentage: $e');
      return null;
    }
  }

  Future<String?> fetchOfferPercentageByName(String brandName) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('offers')
          .where('brand', isEqualTo: brandName)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final brandId = querySnapshot.docs.first.id;
        return fetchOfferPercentage(brandId);
      } else {
        print('Brand with name $brandName not found');
        return null;
      }
    } catch (e) {
      print('Error fetching offer percentage by name: $e');
      return null;
    }
  }

  // Function to fetch the price of a product
  Future<double> fetchProductPrice(String productId) async {
    try {
      final DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();
      final double price = productSnapshot.get('price') as double;
      return price;
    } catch (e) {
      print('Error fetching product price: $e');
      throw e;
    }
  }

  // Function to fetch the offer percentage for a product by its brand name
  Future<double> fetchOfferPercentageByBrandName(String brandName) async {
    try {
      final QuerySnapshot brandSnapshot = await FirebaseFirestore.instance
          .collection('brands')
          .where('name', isEqualTo: brandName)
          .limit(1)
          .get();
      final DocumentSnapshot brandDoc = brandSnapshot.docs.first;
      final double offerPercentage = brandDoc.get('offer_percentage') as double;
      return offerPercentage;
    } catch (e) {
      print('Error fetching offer percentage: $e');
      throw e;
    }
  }

  // Function to calculate the offer price based on the product price and offer percentage
  double calculateOfferPrice(double productPrice, double offerPercentage) {
    try {
      final double offerPrice =
          productPrice - (productPrice * offerPercentage / 100);
      return offerPrice;
    } catch (e) {
      print('Error calculating offer price: $e');
      throw e;
    }
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? "In stock" : "out of stock";
  }

  Future<List<ProductModel>> fetchProductData(
      CategoryType prselectedCategoryType) async {
    try {
      print('.....type is ${prselectedCategoryType}');
      final FirebaseFirestore db = FirebaseFirestore.instance;
      print('connected with firebase..............................');
      final QuerySnapshot querySnapshot = await db.collection('products').get();
      print('connected with firebase...............');

      final List<ProductModel> fetchedproductlist = querySnapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .where((product) {
        print(
            'Product categoryType: ${product.categoryType}, Selected categoryType: $prselectedCategoryType');
        return product.categoryType == prselectedCategoryType;
      }).toList();

      return fetchedproductlist; // Print brand names for each product
      for (var product in fetchedproductlist) {
        print('ppro djdkdkdkdkdkkdk;;;;;;--- name: ${product.productName}');
      }
      print(' brand name isssssssss ${fetchedproductlist[0].brand.name}');
      print('Product list: ${fetchedproductlist[0].productName}');
      // Return the list of product
    } catch (e) {
      print('Error fetching product data: $e');
      throw e; // Rethrow the exception to handle it outside this function if needed
    }
  }
}
