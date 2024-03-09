import 'package:flutter/material.dart';

class SChipTheme {
  SChipTheme._();
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: const Color.fromARGB(255, 247, 2, 174),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: Color.fromARGB(255, 247, 2, 174),
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
