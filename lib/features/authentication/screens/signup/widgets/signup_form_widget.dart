import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/authentication/controllers/signup/signup_controller.dart';
import 'package:purity_pallette/features/authentication/screens/signup/verify_email.dart';
import 'package:purity_pallette/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/validators/validation.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          SValidator.validateEmptyText('First name', value),
                      controller: controller.firstName,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Iconsax.user))),
                ),
                const SizedBox(width: SSizes.spaceBtwnInputFields),
                Expanded(
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.lastName,
                      validator: (value) =>
                          SValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Iconsax.user))),
                ),
              ],
            ),

            //Username
            const SizedBox(height: SSizes.spaceBtwnInputFields),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.userName,
                validator: (value) =>
                    SValidator.validateEmptyText('Username', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Iconsax.user_edit))),

            //Email
            const SizedBox(height: SSizes.spaceBtwnInputFields),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.email,
                validator: (value) => SValidator.validateEmail(value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: 'Email', prefixIcon: Icon(Iconsax.direct))),

            //PhoneNumber
            const SizedBox(height: SSizes.spaceBtwnInputFields),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.phoneNumber,
                validator: (value) => SValidator.validatePhoneNumber(value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: 'Phone Number', prefixIcon: Icon(Iconsax.call))),

            //Password
            const SizedBox(height: SSizes.spaceBtwnInputFields),
            Obx(
              () => TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.password,
                  validator: (value) => SValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                      ))),
            ),
            const SizedBox(height: SSizes.spaceBtwnInputFields),
            TermsAndConditionsCheckbox(dark: dark),
            const SizedBox(
              height: SSizes.spaceBtwnSections,
            ),
            //Signup Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text('Create Account'),
                ))
          ],
        ));
  }
}
