import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/success_screen/success_screen.dart';
import 'package:purity_pallette/data/repositories/authentication/authentication-repository.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

//send email whenever verify screen appears and set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

// Send Email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sedEmailVerification();
      SLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

// Timer to automatically redirect on Email verification
  setTimerForAutoRedirect() {
    try {
      Timer.periodic(const Duration(seconds: 1), (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
              image: SImages.successImage,
              title: 'Successfully Registered',
              subtitle: 'Your account is created',
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect()));
        }
      });
    } catch (e) {
      throw e;
    }
  }

// Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: SImages.successImage,
          title: 'Successfully Registered',
          subtitle: 'Your account is created',
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
