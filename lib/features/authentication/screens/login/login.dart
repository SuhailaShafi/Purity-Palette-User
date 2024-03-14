import 'package:flutter/material.dart';
import 'package:purity_pallette/common/styles/spacing_styles.dart';
import 'package:purity_pallette/common/widgets/login_signup/form_divider.dart';
import 'package:purity_pallette/features/authentication/screens/login/widgets/login_form.dart';
import 'package:purity_pallette/features/authentication/screens/login/widgets/login_header.dart';
import 'package:purity_pallette/common/widgets/login_signup/social_buttons.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo title and Subtitle
              LoginHeaderWidget(dark: dark),

              //Form
              const LoginFormWidget(),

              //Divider
              FormDividerWidget(
                dark: dark,
                dividerText: 'Or SignIn With',
              ),
              const SizedBox(height: SSizes.spaceBtwnItems),

              //Footer
              const SocialButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
