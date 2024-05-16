import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Column(
      children: [
        SSectionHeadingWidget(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
          showActionButton: true,
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          children: [
            CircularContainerWidget(
              width: 60,
              height: 35,
              backgroundColor:
                  dark ? SColors.backgroundWhite : SColors.backgroundWhite,
              padding: EdgeInsets.all(SSizes.sm),
              child: const Image(
                image: AssetImage(SImages.ImgPayPal),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: SSizes.spaceBtwnItems / 2,
            ),
            Text(
              'PayPal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
