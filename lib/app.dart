import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:purity_pallette/bindings/general_bindings.dart';
import 'package:purity_pallette/features/authentication/screens/onboarding/onboarding.dart';
import 'package:purity_pallette/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: OnBoardingScreen(),
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
    );
  }
}
