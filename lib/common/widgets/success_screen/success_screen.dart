import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/styles/spacing_styles.dart';
import 'package:purity_pallette/features/authentication/screens/login/login.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});
  final String image, title, subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: SSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            //Image
            Image(
              image: AssetImage(image),
              width: SHelperFunction.ScreenWidth() * 0.6,
            ),
            const SizedBox(
              height: SSizes.spaceBtwnSections,
            ),

            //title & Subtitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: SSizes.spaceBtwnItems,
            ),

            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: SSizes.spaceBtwnSections,
            ),

            //Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
