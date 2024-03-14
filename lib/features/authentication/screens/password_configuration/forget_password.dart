import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text(
              'Forget Password',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: SSizes.spaceBtwnItems,
            ),

            Text(
              'Don’t worry sometimes people can forget too , enter your email and we will send you a password reset link.',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: SSizes.spaceBtwnSections,
            ),

            ///Textfield
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(
              height: SSizes.spaceBtwnSections,
            ),

            ///Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const ResetPassword()),
                  child: const Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}
