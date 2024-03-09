import 'package:flutter/material.dart';
import 'package:purity_pallette/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class skipOnboardWidget extends StatelessWidget {
  const skipOnboardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: kTextTabBarHeight,
        right: SSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
