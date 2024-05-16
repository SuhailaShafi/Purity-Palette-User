import 'dart:ffi';

import 'package:get/get.dart';
import 'package:purity_pallette/utils/internet/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Networkmanager());
  }
}
