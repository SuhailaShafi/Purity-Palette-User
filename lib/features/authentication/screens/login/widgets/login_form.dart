import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/authentication/screens/signup/signup.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SSizes.spaceBtwnSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: 'Email'),
            ),
            const SizedBox(
              height: SSizes.spaceBtwnInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: 'Password',
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(
              height: SSizes.spaceBtwnInputFields / 2,
            ),
            //Remember me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Remember me
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('Remember Me'),
                  ],
                ),

                //Forget Password
                TextButton(
                    onPressed: () {}, child: const Text('Forget Password'))
              ],
            ),
            const SizedBox(height: SSizes.spaceBtwnSections),

            //SignInButton
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('SignIn'))),
            const SizedBox(
              height: SSizes.spaceBtwnItems,
            ),
            //CreateAccountButton
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => SignUpScreen()),
                    child: const Text('Create Account')))
          ],
        ),
      ),
    );
  }
}
