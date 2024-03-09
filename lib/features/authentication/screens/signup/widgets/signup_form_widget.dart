import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: TextField(
                  expands: false,
                  decoration: InputDecoration(
                      labelText: 'First Name', prefixIcon: Icon(Iconsax.user))),
            ),
            SizedBox(width: SSizes.spaceBtwnInputFields),
            Expanded(
              child: TextField(
                  expands: false,
                  decoration: InputDecoration(
                      labelText: 'Last Name', prefixIcon: Icon(Iconsax.user))),
            ),
          ],
        ),

        //Username
        const SizedBox(height: SSizes.spaceBtwnInputFields),
        const TextField(
            expands: false,
            decoration: InputDecoration(
                labelText: 'Username', prefixIcon: Icon(Iconsax.user_edit))),

        //Email
        const SizedBox(height: SSizes.spaceBtwnInputFields),
        const TextField(
            expands: false,
            decoration: InputDecoration(
                labelText: 'Email', prefixIcon: Icon(Iconsax.direct))),

        //PhoneNumber
        const SizedBox(height: SSizes.spaceBtwnInputFields),
        const TextField(
            expands: false,
            decoration: InputDecoration(
                labelText: 'Phone Number', prefixIcon: Icon(Iconsax.call))),

        //Password
        const SizedBox(height: SSizes.spaceBtwnInputFields),
        const TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash))),
        const SizedBox(height: SSizes.spaceBtwnInputFields),
        Row(
          children: [
            SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {})),
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
              TextSpan(
                  text: 'and', style: Theme.of(context).textTheme.bodySmall),
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
        ),
        const SizedBox(
          height: SSizes.spaceBtwnSections,
        ),
        //Signup Button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Create Account'),
            ))
      ],
    ));
  }
}
