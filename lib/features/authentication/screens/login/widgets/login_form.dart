import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/authentication/controllers/login/login_controller.dart';
import 'package:purity_pallette/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:purity_pallette/features/authentication/screens/signup/signup.dart';
import 'package:purity_pallette/navigation_menu.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/validators/validation.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loginController());
    return Form(
      key: controller.loginformkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SSizes.spaceBtwnSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => SValidator.validateEmail(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: 'Email'),
            ),
            const SizedBox(
              height: SSizes.spaceBtwnInputFields,
            ),
            Obx(
              () => TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.password,
                  validator: (value) => SValidator.validatePassword(value),
                  obscureText: controller.hidepassword.value,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        icon: Icon(controller.hidepassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                        onPressed: () => controller.hidepassword.value =
                            !controller.hidepassword.value,
                      ))),
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
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text('Remember Me'),
                  ],
                ),

                //Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text('Forget Password'))
              ],
            ),
            const SizedBox(height: SSizes.spaceBtwnSections),

            //SignInButton
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text('SignIn'))),
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
