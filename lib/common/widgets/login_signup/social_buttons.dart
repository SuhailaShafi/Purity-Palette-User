import 'package:flutter/material.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: SColors.textgrey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(SImages.google),
                width: SSizes.icmd,
                height: SSizes.icmd,
              )),
        ),
        const SizedBox(width: SSizes.spaceBtwnItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: SColors.textgrey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(SImages.facebook),
                width: SSizes.iclg,
                height: SSizes.iclg,
              )),
        )
      ],
    );
  }
}
