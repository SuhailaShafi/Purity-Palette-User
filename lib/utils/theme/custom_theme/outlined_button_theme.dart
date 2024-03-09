import 'package:flutter/material.dart';

class SOutlinedButtonTheme {
  SOutlinedButtonTheme._();
  static final lightOutLinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          side: const BorderSide(color: Color.fromARGB(255, 247, 2, 174)),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))));
  static final darkOutLinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Color.fromARGB(255, 247, 2, 174)),
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))));
}
