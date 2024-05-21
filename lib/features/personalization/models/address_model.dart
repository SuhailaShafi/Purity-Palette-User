import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

//Helper function to format phone number
  // String get formattedPhoneNumber => SFormatter.formatPhoneNumber(phoneNumber);

//static function to create an empty usermodel
  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      postalCode: '',
      street: '',
      city: '',
      phoneNumber: '',
      state: '',
      country: '');
  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as String,
      name: map['name'] as String,
      street: map['street'] as String,
      city: map['city'] as String,
      postalCode: map['potalCode'] as String,
      phoneNumber: map['phoneNumber'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      selectedAddress: map['selectedAddress'] as bool,
      dateTime: (map['dateTime']).toDate(),
    );
  }
  factory AddressModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data() as Map<String, dynamic>;
    return AddressModel(
      id: document.id,
      name: data['name'] ?? '',
      street: data['street'] ?? '',
      city: data['city'] ?? '',
      postalCode: data['postalCode'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      state: data['state'] ?? '',
      country: data['country'] ?? '',
      selectedAddress: data['selectedAddress'] as bool,
      dateTime: (data['dateTime'] as Timestamp).toDate(),
    );
    /* AddressModel(
      id: document.id,
      country: data['country'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      city: data['city'] ?? '',
      selectedAddress: data['selectedAddress'] ?? false,
      street: data['street'] ?? '',
      postalCode: data['postalCode'] ?? '',
      name: data['name'] ?? '',
      state: data['state'] ?? '',
      dateTime: (data['dateTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );*/
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'street': street,
      'city': city,
      'postalCode': postalCode,
      'phoneNumber': phoneNumber,
      'state': state,
      'country': country,
      'dateTime': dateTime,
      'selectedAddress': selectedAddress,
    };
  }
  // Method to convert UserModel object to JSON

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'street': street,
      'city': city,
      'postalCode': postalCode,
      'phoneNumber': phoneNumber,
      'state': state,
      'country': country,
      'dateTime': DateTime.now(),
      'selectedAddress': selectedAddress,
    };
  }

  @override
  String toString() {
    return '$street,$city,$postalCode,$country';
  }
}
