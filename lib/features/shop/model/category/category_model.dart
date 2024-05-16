import 'package:cloud_firestore/cloud_firestore.dart';

enum CategoryType {
  Hair,
  Skin,
  Makeup,
}

class Category {
  final String? id;
  final CategoryType? categoryType;
  final String? name;

  final String? imageUrl;

  Category({this.id, this.categoryType, this.name, this.imageUrl});

  // Convert Category object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryType':
          categoryType.toString().split('.').last, // Convert enum to string
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  // Factory constructor to create Category object from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    // Convert categoryType string to CategoryType enum
    CategoryType type = CategoryType.values.firstWhere(
      (type) => type.toString() == 'CategoryType.${json['categoryType']}',
      orElse: () => CategoryType.Hair, // Default to Hair if not found
    );

    return Category(
      id: json['id'] ?? 0,
      categoryType: type,
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
