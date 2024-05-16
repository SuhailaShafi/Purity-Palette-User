import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/features/personalization/controllers/user_controller.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/validators/validation.dart';

class ReAuthloginform extends StatelessWidget {
  const ReAuthloginform({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('ReAuthenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: SValidator.validateEmail,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: 'Email'),
                  ),
                  SizedBox(
                    height: SSizes.spaceBtwnInputFields,
                  ),
                  TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        SValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(Iconsax.eye_slash)),
                        labelText: 'Password'),
                  ),
                  SizedBox(height: SSizes.spaceBtwnSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPassword(),
                        child: Text('Verify')),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
