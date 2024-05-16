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

  static Widget? checkSingleRecordState<T>(
      {required AsyncSnapshot<T> snapshot}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text("No data found"),
      );
    }
    if (snapshot.hasError) {
      return const Center(
        child: Text("Something went wrong"),
      );
    }
    return null;
  }

  static Widget? checkMultiRecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(
        child: Text("No data found"),
      );
    }
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(
        child: Text("Something went wrong"),
      );
    }
    return null;
  }
}
