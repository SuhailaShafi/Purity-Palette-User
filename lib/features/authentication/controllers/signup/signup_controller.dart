import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/data/repositories/authentication/authentication-repository.dart';
import 'package:purity_pallette/data/repositories/user/user_repository.dart';
import 'package:purity_pallette/features/authentication/models/user_model/user_model.dart';
import 'package:purity_pallette/features/authentication/screens/signup/verify_email.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/internet/network_manager.dart';
import 'package:purity_pallette/utils/popup/full_screen_loader.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

//variables
  final hidePassword = true.obs; //observable for hiding/showing password
  final privacypolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
//--Signup
  void signup() async {
    try {
      print('clicked signup button..............................');

      //start loading
      SFullScreenLoader.openLoadingDialog('We are processing your information',
          'assets/animation_loading.json');

      //check internet connectivity
      final isConnected = await Networkmanager.instance.isConnected();
      if (!isConnected) {
        print('not connected..............');
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoaduing();

        return;
      }
      print('validated');
      //privacy policy check
      if (!privacypolicy.value) {
        SLoaders.warningSnackBar(
            title: 'Accept privacy policy',
            message:
                'Inorder to create account you must have to read and accept the privacy policy and terms of use');
        print('not checked.......................');
        return;
      } //Register user in firebase authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      final newuser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePictureUrl: '',
      );

      //Save authenticated user data in firestore

      print('newuser is................................................');
      print('username: ${newuser.userName}, email: ${newuser.email}');
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newuser);

      SFullScreenLoader.stopLoaduing();
      //Show success meassage
      SLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! verify email to continue');
      print('successful.......................');
    } catch (e) {
      //Show more generic error to user
      SLoaders.errorSnackBar(title: 'onsnap', message: e.toString());
    } finally {
      SFullScreenLoader.stopLoaduing();
      //Remove loader
      //Move to verify email screen
      Get.to(() => Verifyemail(
            email: email.text.trim(),
          ));
      print('Go to verify email');
    }
  }
}
