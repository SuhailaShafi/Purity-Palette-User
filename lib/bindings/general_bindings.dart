import 'dart:ffi';

import 'package:get/get.dart';
import 'package:purity_pallette/features/personalization/controllers/address_controller.dart';
import 'package:purity_pallette/features/shop/controllers/checkout_controller.dart';
import 'package:purity_pallette/utils/internet/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Networkmanager());
    Get.put(CheckoutController());
    Get.put(AddressController());
  }
}
