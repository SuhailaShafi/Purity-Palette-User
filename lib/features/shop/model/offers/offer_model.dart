import 'package:purity_pallette/features/shop/model/brands/brand_model.dart';

class OfferModel {
  String id;
  BrandModel brand;
  int percentage;
  String image;

  OfferModel({
    required this.id,
    required this.percentage,
    required this.brand,
    required this.image,
  });

  // Convert Category object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand, // Convert enum to string
      'percentage': percentage,
      'image': image,
    };
  }

  // Factory constructor to create Category object from JSON
  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] ?? '',
      percentage:
          json['percentage'] != null ? int.parse(json['percentage']) : 0,
      brand: json['brand'] != null
          ? BrandModel(name: json['brand'] ?? '')
          : BrandModel(),
      image: json['image'] ?? '',
    );
  }
}
