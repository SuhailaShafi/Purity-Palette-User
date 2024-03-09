import 'package:flutter/material.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(dark ? SImages.darkAppLogo : SImages.lightAppLogo),
          height: 150,
        ),
        Text(
          'Welcome,',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: SSizes.sm,
        ),
        Text(
          'Discover Limitless Choices and fill your palette',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
