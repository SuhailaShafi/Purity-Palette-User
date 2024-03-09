import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class onboardingWidget extends StatelessWidget {
  onboardingWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.subtitle});

  final String title, subtitle, image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: MediaQuery.sizeOf(context).height * 0.5,
            image: AssetImage(image),
          ),
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: SSizes.spaceBtwnItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
