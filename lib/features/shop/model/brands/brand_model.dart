import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String imageUrl;
  @override
  String toString() {
    return 'BrandModel{id: $id, name: $name,  imageUrl: $imageUrl}';
  }

  BrandModel({this.id = '', this.name = '', this.imageUrl = ''});

  // Convert Category object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  // Factory constructor to create Category object from JSON
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
