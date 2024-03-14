import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/success_screen/success_screen.dart';
import 'package:purity_pallette/features/authentication/screens/login/login.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class Verifyemail extends StatelessWidget {
  const Verifyemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
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
                'Verify your email address',
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
                'Congratulations, Your account is created. Verify your email to start shopping and experience  world of unrevealed deals and personalized offers',
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
                  onPressed: () => Get.to(() => SuccessScreen(
                        image: 'assets/images/verification_success.jpg',
                        title: 'Your account successfully created!',
                        subtitle:
                            'Welcome to your ultimate shopping destination . Your account is created experience the joy of seamless online shopping!',
                        onPressed: () => Get.to(() => LoginScreen()),
                      )),
                  child: const Text('Continue'),
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
