import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Positioned(
      right: SSizes.defaultSpace,
      bottom: 50,
      child: /* ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: Icon(Iconsax.arrow_right_3),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor:
                dark ? SColors.backgroundPurple : SColors.backgroundDark),
      ),*/
          Material(
        color: Colors.transparent,
        child: Ink(
          decoration: ShapeDecoration(
            color: dark ? SColors.backgroundPurple : SColors.backgroundDark,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(Iconsax.arrow_right_3),
            onPressed: () => OnBoardingController.instance.nextPage(),
          ),
        ),
      ),
    );
  }
}
