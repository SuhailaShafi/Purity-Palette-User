import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SSectionHeadingWidget(
          title: 'Shiping Address',
          buttonTitle: 'Change',
          onPressed: () {},
          showActionButton: true,
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Text(
          'Suhaila Parvin',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: SSizes.spaceBtwnItems),
            Text(
              "+91 79434723",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: SSizes.spaceBtwnItems),
            Expanded(
              child: Text(
                "South liame, Kerala India",
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            )
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
      ],
    );
  }
}
