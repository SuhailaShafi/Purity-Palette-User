import 'package:flutter/material.dart';
import 'package:purity_pallette/utils/theme/custom_theme/appbar_theme.dart';
import 'package:purity_pallette/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:purity_pallette/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:purity_pallette/utils/theme/custom_theme/chip_theme.dart';
import 'package:purity_pallette/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:purity_pallette/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:purity_pallette/utils/theme/custom_theme/text_field_theme.dart';
import 'package:purity_pallette/utils/theme/custom_theme/text_theme.dart';

class SAppTheme {
  SAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'poppins',
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 247, 2, 174),
      scaffoldBackgroundColor: Colors.white,
      textTheme: STextTheme.lightTextTheme,
      elevatedButtonTheme: SElevatedButtonTheme.lightElevatedTheme,
      chipTheme: SChipTheme.lightChipTheme,
      appBarTheme: SAppBarTheme.lightAppBarTheme,
      checkboxTheme: SCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: SBottomSheetTheme.lightBottomSheetTheme,
      outlinedButtonTheme: SOutlinedButtonTheme.lightOutLinedButtonTheme,
      inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'poppins',
      brightness: Brightness.dark,
      primaryColor: Color.fromARGB(255, 247, 2, 174),
      scaffoldBackgroundColor: Colors.black,
      textTheme: STextTheme.darkTextTheme,
      elevatedButtonTheme: SElevatedButtonTheme.darkElevatedTheme,
      chipTheme: SChipTheme.darkChipTheme,
      appBarTheme: SAppBarTheme.darkAppBarTheme,
      checkboxTheme: SCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: SBottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: SOutlinedButtonTheme.darkOutLinedButtonTheme,
      inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme);
}
