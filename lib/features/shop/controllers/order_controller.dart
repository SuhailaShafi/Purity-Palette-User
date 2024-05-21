import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/success_screen/success_screen.dart';
import 'package:purity_pallette/data/repositories/authentication/authentication-repository.dart';
import 'package:purity_pallette/data/repositories/products/order_repository.dart';
import 'package:purity_pallette/features/personalization/controllers/address_controller.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/features/shop/controllers/checkout_controller.dart';
import 'package:purity_pallette/features/shop/model/orders/order_model.dart';
import 'package:purity_pallette/navigation_menu.dart';
import 'package:purity_pallette/utils/constants/enums.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/popup/full_screen_loader.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
//variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());
//fetch users order History
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      print("fetching...orders");
      final userOrders = await orderRepository.fetchUserOrders();
      print("user orders are...$userOrders");
      return userOrders;
    } catch (e) {
      SLoaders.warningSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }

//Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      //start loader
      SFullScreenLoader.openLoadingDialog(
          "Processing your order", SImages.SAnimationImage);
      //SFullScreenLoader.openLoadingDialog(
      //'Logging you in ..', SImages.successImage);
      //Get user authentication id
      final userId = AuthenticationRepository.instance.authUser?.uid;
      //if (userId!.isEmpty) return;
      //Add details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId!,
        status: OrderStatus.pending,
        items: cartController.cartItems.toList(),
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        //address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        //paymentMethod: checkoutController.selectedPaymentMethod.value.name,
      );
      //save the order to firestore
      await orderRepository.saveOrder(order, userId);
      //update the cart status
      cartController.clearCart();
      //show success screen
      //SFullScreenLoader.stopLoaduing();
      Get.off(() => SuccessScreen(
          image: SImages.successImage,
          title: 'Payment success',
          subtitle: "Your item will be shipped soon",
          onPressed: () => Get.offAll(() => NavigationMenu())));
    } catch (e) {
      SFullScreenLoader.stopLoaduing();
      SLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
