import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboadingDotNavigationWidget extends StatelessWidget {
  const OnboadingDotNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = SHelperFunction.isDarkMode(context);
    return Positioned(
        bottom: 70,
        left: SSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor:
                  dark ? SColors.backgroundWhite : SColors.backgroundDark,
              dotHeight: 6),
        ));
  }
}
