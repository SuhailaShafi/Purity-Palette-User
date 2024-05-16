import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purity_pallette/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:purity_pallette/features/shop/model/brands/brand_model.dart';
import 'package:purity_pallette/features/shop/model/category/category_model.dart';

class CartItemModel {
  String id;
  String productName;
  String brandName;
  double price;
  int number;
  String image1;

  CartItemModel({
    required this.id,
    this.productName = '',
    this.brandName = '',
    this.price = 0.0,
    required this.number,
    this.image1 = '',
  });
//empty cart
  static CartItemModel empty() => CartItemModel(id: "", number: 0);
  // Convert Category object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': productName,
      'brandName': brandName,
      'price': price,
      'number': number,
      'image1': image1,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] ?? '',
      productName: json['name'] ?? '',
      brandName: json['brandName'] ?? '',
      price: json['price'] != null
          ? (json['price'] is double
              ? json['price']
              : double.parse(json['price']))
          : 0.0,
      number: json['number'] != null
          ? (json['number'] is int ? json['number'] : int.parse(json['number']))
          : 0,
      image1: json['image1'] ?? '',
    );
  }
  /* factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
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
  }*/
}
