import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:purity_pallette/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:purity_pallette/features/authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:purity_pallette/features/authentication/screens/onboarding/widgets/skip_onboarding.dart';
import 'package:purity_pallette/features/authentication/screens/onboarding/widgets/view_onboarding.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/constants/text_strings.dart';
import 'package:purity_pallette/utils/device/device_utility.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              onboardingWidget(
                title: STexts.onboardingTitle1,
                subtitle: STexts.onboardingSubtitle1,
                image: SImages.onboardingOne,
              ),
              onboardingWidget(
                title: STexts.onboardingTitle2,
                subtitle: STexts.onboardingSubtitle2,
                image: SImages.onboardingThree,
              ),
              onboardingWidget(
                title: STexts.onboardingTitle3,
                subtitle: STexts.onboardingSubtitle3,
                image: SImages.onboardingTwo,
              )
            ],
          ),
          //skip_Button
          const skipOnboardWidget(),

          //Dot_Navigation_SmoothpageIndicator
          const OnboadingDotNavigationWidget(),

          //Circular Button
          OnboardingNextButton()
        ],
      ),
    );
  }
}
