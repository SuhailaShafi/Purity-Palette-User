import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purity_pallette/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:purity_pallette/features/shop/model/brands/brand_model.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';

class ProductModel {
  final String id;
  final String productName;
  final CategoryType categoryType;
  final Category category;
  final int quantity;
  final BrandModel brand;
  final double price;
  final int number;
  final String description;
  final String applicable;
  final String image1;
  final String image2;
  final String image3;

  ProductModel({
    required this.id,
    required this.productName,
    required this.categoryType,
    required this.category,
    required this.quantity,
    required this.brand,
    required this.price,
    required this.number,
    required this.description,
    required this.applicable,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  // Convert Category object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': productName,
      'categoryType': categoryType,
      'category': category,
      'quantity': quantity,
      'brand': brand,
      'price': price,
      'number': number,
      'description': description,
      'applicable': applicable,
      'image1': image1,
      'image2': image2,
      'image3': image3,
    };
  }

  // Factory constructor to create Category object from JSON
  /*factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      productName: json['name'] ?? '',
      categoryType: json['categoryType'] != null
          ? CategoryType.values.firstWhere(
              (e) => e.toString() == 'CategoryType.${json['categoryType']}',
              orElse: () => CategoryType.Makeup)
          : CategoryType.Makeup,
      category: Category(name: json['category'] ?? ''),
      quantity: json['number'] != null ? int.parse(json['number']) : 0,
      brand: json['brand']
              is Map<String, dynamic> // Check if 'brand' is a JSON object
          ? BrandModel.fromJson(json['brand']
              as Map<String, dynamic>) // Parse 'brand' as BrandModel
          : BrandModel(),
      price: json['price'] != null ? double.parse(json['price']) : 0.0,
      number: json['number'] != null ? int.parse(json['number']) : 0,
      description: json['description'] ?? '',
      applicable: json['applicable'] ?? '',
      image1: json['image1'] ?? '',
      image2: json['image2'] ?? '',
      image3: json['image3'] ?? '',
    );
  }*/
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      productName: json['name'] ?? '',
      categoryType: json['categoryType'] != null
          ? _parseCategoryType(json['categoryType'])
          : CategoryType.Hair,
      category: Category(name: json['category'] ?? ''),
      quantity: json['quantity'] != null ? int.parse(json['quantity']) : 0,
      brand: json['brand'] != null
          ? BrandModel(name: json['brand'] ?? '')
          : BrandModel(),
      price: json['price'] != null ? double.parse(json['price']) : 0.0,
      number: json['number'] != null ? int.parse(json['number']) : 0,
      description: json['description'] ?? '',
      applicable: json['applicable'] ?? '',
      image1: json['image1'] ?? '',
      image2: json['image2'] ?? '',
      image3: json['image3'] ?? '',
    );
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductModel(
      id: snapshot.id,
      productName: data['name'] ?? '',
      categoryType: data['categoryType'] != null
          ? CategoryType.values.firstWhere(
              (e) => e.toString() == 'CategoryType.${data['categoryType']}',
              orElse: () => CategoryType.Makeup)
          : CategoryType.Makeup,
      category: Category(name: data['category'] ?? ''),
      quantity: data['number'] != null ? int.parse(data['number']) : 0,
      brand: data['brand'] != null
          ? BrandModel(name: data['brand'] ?? '')
          : BrandModel(),
      price: data['price'] != null ? double.parse(data['price']) : 0.0,
      number: data['number'] != null ? int.parse(data['number']) : 0,
      description: data['description'] ?? '',
      applicable: data['applicable'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      productName: data['name'] ?? '',
      categoryType: data['categoryType'] != null
          ? CategoryType.values.firstWhere(
              (e) => e.toString() == 'CategoryType.${data['categoryType']}',
              orElse: () => CategoryType.Makeup)
          : CategoryType.Makeup,
      category: Category(name: data['category'] ?? ''),
      quantity: data['number'] != null ? int.parse(data['number']) : 0,
      brand: data['brand'] != null
          ? BrandModel(name: data['brand'] ?? '')
          : BrandModel(),
      price: data['price'] != null ? double.parse(data['price']) : 0.0,
      number: data['number'] != null ? int.parse(data['number']) : 0,
      description: data['description'] ?? '',
      applicable: data['applicable'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
    );
  }
  static CategoryType _parseCategoryType(String categoryTypeString) {
    switch (categoryTypeString) {
      case 'CategoryType.Makeup':
        return CategoryType.Makeup;
      case 'CategoryType.Skin':
        return CategoryType.Skin;
      case 'CategoryType.Hair':
        return CategoryType.Hair;
      // Add more cases for other category types if needed
      default:
        return CategoryType.Hair; // Default to Makeup if unknown
    }
  }
}
