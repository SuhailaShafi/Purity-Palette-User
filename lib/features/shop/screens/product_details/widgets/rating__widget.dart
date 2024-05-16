import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SRatingWidget extends StatelessWidget {
  const SRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Iconsax.star5, color: SColors.primary, size: 24),
        const SizedBox(width: SSizes.spaceBtwnItems / 2),
        Text.rich(TextSpan(children: [
          TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
          const TextSpan(
            text: '(199)',
          )
        ]))
      ],
    );
  }
}
