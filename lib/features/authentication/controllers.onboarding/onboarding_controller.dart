import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///update current index When Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to the specific dot Selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  ///Update Current Index and Jump to the Next Page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///Update Current Index and Jump to Last Page
  void skipPage() async {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
