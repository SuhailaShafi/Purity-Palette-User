import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purity_pallette/features/personalization/models/address_model.dart';
import 'package:purity_pallette/features/shop/model/cart/cart_item_model.dart';
import 'package:purity_pallette/utils/constants/enums.dart';

/*class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;
  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Payal',
    this.address,
    this.deliveryDate,
  });
  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: snapshot.id,
      userId: data['userId'] as String? ?? '',
      status:
          OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      totalAmount: (data['totalAmount'] as num?)?.toDouble() ?? 0.0,
      orderDate: (data['orderDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      paymentMethod: data['paymentMethod'] as String? ?? 'PayPal',
      address: data['address'] != null
          ? AddressModel.fromMap(data['address'] as Map<String, dynamic>)
          : null,
      deliveryDate: (data['deliveryDate'] as Timestamp?)?.toDate(),
      items: (data['items'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}*/

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  //final String paymentMethod;
  //final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    //this.paymentMethod = 'PayPal',
    //this.address,
    this.deliveryDate,
  });

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      //'paymentMethod': paymentMethod,
      //'address': address?.toJson(),
      'deliveryDate': deliveryDate,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    print("Data from snapshot: $data");

    try {
      final id = snapshot.id;
      print("Order ID: $id");

      final userId = data['userId'];
      print("User ID: $userId (Type: ${userId.runtimeType})");

      final statusStr = data['status'];
      print("Status: $statusStr (Type: ${statusStr.runtimeType})");

      if (statusStr == null) {
        throw Exception("Status is null in the document snapshot.");
      }

      final status = OrderStatus.values.firstWhere(
        (e) => e.toString() == statusStr,
        orElse: () => OrderStatus.processing,
      );

      final totalAmount = data['totalAmount'];
      print("Total Amount: $totalAmount (Type: ${totalAmount.runtimeType})");

      final orderDate = data['orderDate'];
      print("Order Date: $orderDate (Type: ${orderDate.runtimeType})");

      //final paymentMethod = data['paymentMethod'];
      //print(
      //  "Payment Method: $paymentMethod (Type: ${paymentMethod.runtimeType})");

      /* final addressMap = data['address'] as Map<String, dynamic>?;
      AddressModel? address;
      if (addressMap != null) {
        address = AddressModel.fromMap(addressMap);
      }*/
      final deliveryDate = data['deliveryDate'];
      print("Delivery Date: $deliveryDate (Type: ${deliveryDate.runtimeType})");

      final itemsList = data['items'];
      print("Items: $itemsList (Type: ${itemsList.runtimeType})");

      List<CartItemModel> items = [];
      if (itemsList != null) {
        items = List<CartItemModel>.from(itemsList
            .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>)));
      }

      final order = OrderModel(
        id: id,
        userId: userId as String? ?? '',
        status: status,
        totalAmount: (totalAmount as num?)?.toDouble() ?? 0.0,
        orderDate: (orderDate as Timestamp?)?.toDate() ?? DateTime.now(),
        //paymentMethod: paymentMethod as String? ?? 'PayPal',
        //address: address,
        deliveryDate: (deliveryDate as Timestamp?)?.toDate(),
        items: items,
      );

      print("Created OrderModel: $order");
      return order;
    } catch (e) {
      print("Error occurred while converting snapshot to OrderModel: $e");
      throw Exception("Error converting document to OrderModel: $e");
    }
  }
}
