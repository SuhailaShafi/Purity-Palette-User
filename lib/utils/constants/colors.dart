import 'package:flutter/material.dart';

class SColors {
  SColors._();
  static const Color primary = Color.fromARGB(255, 245, 67, 183);
  static const Color secondary = Color.fromARGB(255, 253, 252, 252);
  static const Color accent = Color.fromARGB(0, 115, 228, 236);
//Text colors
  static const Color textprimary = Color.fromARGB(255, 120, 117, 117);
  static const Color textgrey = Color.fromARGB(255, 66, 65, 65);
  static const Color textwhite = Color.fromARGB(255, 9, 9, 9);
//Background colors
  static const Color backgroundPurple = Color.fromARGB(255, 190, 146, 193);
  static const Color backgroundDark = Color.fromARGB(255, 66, 65, 65);
  static const Color backgroundWhite = Color.fromARGB(255, 254, 253, 253);
//textfield colors
  static const Color tfPurple = Color.fromARGB(255, 190, 146, 193);
  static const Color tforange = Color.fromARGB(255, 199, 145, 101);
  static const Color tfpink = Color.fromARGB(255, 201, 126, 154);
  static const Color tfgreen = Color.fromARGB(255, 117, 166, 144);
  static const Color tfblue = Color.fromARGB(255, 121, 146, 164);
  static const Gradient lineargradient = LinearGradient(colors: [
    Color.fromARGB(255, 232, 149, 177),
    Color.fromARGB(255, 211, 129, 212),
    Color.fromARGB(255, 204, 121, 220)
  ]);
}
