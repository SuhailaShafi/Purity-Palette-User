import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  String firstName;
  String lastName;
  final String userName;
  String phoneNumber;
  String profilePictureUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    required this.profilePictureUrl,
  });
//Helper function to get the fullname
  String get fullname => '$firstName $lastName';
//Helper function to format phone number
  //String get formattedPhoneNumber => SFormatter.formatPhoneNumber(phoneNumber);
//static function to split fullname into first and lastname
  static List<String> nameParts(fullName) => fullName.split(" ");
//static function to generate a username from the fullname
  static String generateUserName(fullName) {
    List<String> nameparts = fullName.split(" ");
    String firstName = nameparts[0].toLowerCase();
    String lastName = nameparts.length > 1 ? nameparts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

//static function to create an empty usermodel
  static UserModel empty() => UserModel(
      id: '',
      email: '',
      firstName: '',
      lastName: '',
      userName: '',
      phoneNumber: '',
      profilePictureUrl: '');
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      profilePictureUrl: map['profilePictureUrl'],
    );
  }
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data['email'] ?? '',
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        userName: data['userName'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePictureUrl: data['profilePictureUrl'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'profilePictureUrl': profilePictureUrl,
    };
  }
  // Method to convert UserModel object to JSON

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
