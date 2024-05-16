import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class Networkmanager extends GetxController {
  static Networkmanager get instance => Get.find();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitysubscription;
  final Rx<ConnectivityResult> _connectionstatus = ConnectivityResult.none.obs;
  @override
  void onInit() {
    super.onInit();
    _connectivitysubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

//update the connection status based on changes in connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionstatus.value = result;
    if (_connectionstatus.value == ConnectivityResult.none) {
      SLoaders.warningSnackBar(title: 'No internet Connection');
    }
  }

  //Check Internet connection status
  //Returns true if connected , false otherwise

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  } //Dispose or close the active connectivity stream

  @override
  void onclose() {
    super.onClose();
    _connectivitysubscription.cancel();
  }
}
