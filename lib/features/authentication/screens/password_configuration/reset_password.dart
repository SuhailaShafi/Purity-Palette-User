import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/success_screen/success_screen.dart';
import 'package:purity_pallette/features/authentication/screens/login/login.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                image: const AssetImage('assets/images/email_reset.png'),
                width: SHelperFunction.ScreenWidth() * 0.6,
              ),
              const SizedBox(
                height: SSizes.spaceBtwnSections,
              ),

              //title & Subtitle
              Text(
                'Password Reset Email Resend',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              Text(
                'Suhailaparvins@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              Text(
                'Your account security is our priority! we have send you a secure link to safely change your password and keep your ccount protected.',
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
                  onPressed: () => Get.to(
                    () => LoginScreen(),
                  ),
                  child: const Text('Done'),
                ),
              ),
              const SizedBox(
                height: SSizes.spaceBtwnItems,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Resend email'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
