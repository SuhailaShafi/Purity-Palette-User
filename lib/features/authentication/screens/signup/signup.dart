import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/login_signup/form_divider.dart';
import 'package:purity_pallette/common/widgets/login_signup/social_buttons.dart';
import 'package:purity_pallette/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                'Lets create your account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: SSizes.spaceBtwnSections),

              //Form
              SignUpFormWidget(dark: dark),
              const SizedBox(height: SSizes.spaceBtwnItems),

              //Divider
              FormDividerWidget(dark: dark, dividerText: 'or SignUp with'),
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
