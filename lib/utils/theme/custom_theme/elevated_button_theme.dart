import 'package:flutter/material.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();
  static final lightElevatedTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 247, 2, 174),
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: Color.fromARGB(255, 247, 2, 174)),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
  static final darkElevatedTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 247, 2, 174),
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: Color.fromARGB(255, 247, 2, 174)),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
