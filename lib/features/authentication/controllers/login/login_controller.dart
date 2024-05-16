import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purity_pallette/data/repositories/authentication/authentication-repository.dart';
import 'package:purity_pallette/features/personalization/controllers/user_controller.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/internet/network_manager.dart';
import 'package:purity_pallette/utils/popup/full_screen_loader.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class loginController extends GetxController {
  //variables
  final rememberMe = false.obs;
  final hidepassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  /* @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }*/

  Future<void> emailAndPasswordSignIn() async {
    try {
      //start loading
      SFullScreenLoader.openLoadingDialog(
          'Logging you in ..', SImages.successImage);
      //check internet connectivity
      final isConnected = await Networkmanager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoaduing();
        print('not connected..............');
        return;
      }

      //form validation
      if (!loginformkey.currentState!.validate()) {
        SFullScreenLoader.stopLoaduing();

        return;
      }
      print('validated');
      //Save Data if remenber me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user using email and password
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove loader
      SFullScreenLoader.stopLoaduing();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      SFullScreenLoader.stopLoaduing();
      SLoaders.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  }

//google signin
  Future<void> googleSignIn() async {
    try {
      //start loading
      SFullScreenLoader.openLoadingDialog(
          'Logging you in', SImages.SAnimationImage);
      //check internet connectivity//
      final isConnected = await Networkmanager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoaduing();
        print('not connected..............');
        return;
      }
      //google authentication
      final userCredential =
          await AuthenticationRepository.instance.signinWithGoogle();
      //save user Records
      await userController.saveUserRecord(userCredential);
      //Remove Loader
      SFullScreenLoader.stopLoaduing();
      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      SFullScreenLoader.stopLoaduing();
      SLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
