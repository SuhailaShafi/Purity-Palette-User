import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/data/repositories/authentication/authentication-repository.dart';
import 'package:purity_pallette/features/shop/model/orders/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();
//variables
  final _db = FirebaseFirestore.instance;
//Get all order related to current user
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId == null) {
        throw "User ID is null. User might not be authenticated.";
      }
      print("Fetching orders for user ID: $userId");

      final result =
          await _db.collection("Users").doc(userId).collection("Orders").get();
      print("Fetched order documents: ${result.docs.length}");

      final orders = result.docs.map((documentSnapshot) {
        print("Processing document ID: ${documentSnapshot.id}");
        return OrderModel.fromSnapshot(documentSnapshot);
      }).toList();

      print("Order list: $orders");
      return orders;
    } catch (e) {
      print("Error occurred while fetching orders: $e");
      throw "Something went wrong while fetching order information, try again later";
    }
  }

  //store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection("Users")
          .doc(userId)
          .collection("Orders")
          .add(order.toJson());
    } catch (e) {
      throw "Something went wrong while saving order information, Try again later";
    }
  }
}
