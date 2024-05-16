import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/authentication/controllers/signup/signup_controller.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacypolicy.value,
                onChanged: (value) => controller.privacypolicy.value =
                    !controller.privacypolicy.value))),
        const SizedBox(
          width: SSizes.spaceBtwnItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: 'is agree to',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: ' Privacy policy ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark
                        ? Colors.white
                        : const Color.fromARGB(255, 191, 26, 202),
                    decoration: TextDecoration.underline,
                    decorationColor: dark
                        ? Colors.white
                        : const Color.fromARGB(255, 191, 26, 202),
                  )),
          TextSpan(text: 'and', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: ' Terms of use ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark
                      ? Colors.white
                      : const Color.fromARGB(255, 191, 26, 202),
                  decoration: TextDecoration.underline,
                  decorationColor: dark
                      ? Colors.white
                      : const Color.fromARGB(255, 191, 26, 202))),
        ]))
      ],
    );
  }
}
