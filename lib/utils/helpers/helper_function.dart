import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SHelperFunction {
  static void navigateToScreen(BuildContext context, Widget Screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Screen),
    );
  }

  static String truncateText(String text, int maxlength) {
    if (text.length <= maxlength) {
      return text;
    } else {
      return '${text.substring(0, maxlength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size ScreenSize() {
    return MediaQuery.sizeOf(Get.context!);
  }

  static double ScreenHeight() {
    return MediaQuery.sizeOf(Get.context!).height;
  }

  static double ScreenWidth() {
    return MediaQuery.sizeOf(Get.context!).width;
  }
}
