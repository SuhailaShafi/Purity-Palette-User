import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/products/ratings/rating_indicator.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(SImages.onboardingOne)),
                SizedBox(width: SSizes.spaceBtwnItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems),

        ///Review
        Row(
          children: [
            SRatingBarIndicator(rating: 4),
            Text(
              '01 Nov, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems),
        ReadMoreText(
          'The user Interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great job.',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SColors.primary),
        ),
        const SizedBox(
          height: SSizes.spaceBtwnItems,
        ),

        ///Company Review
        CircularContainerWidget(
          backgroundColor: dark
              ? SColors.backgroundDark
              : const Color.fromARGB(255, 201, 201, 201),
          child: Padding(
            padding: EdgeInsets.all(SSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Palette ',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('2 Nov,2023 ',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: SSizes.spaceBtwnItems),
                ReadMoreText(
                  'The user Interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly, Great job.',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SColors.primary),
                ),
                SizedBox(height: SSizes.spaceBtwnSections),
              ],
            ),
          ),
        )
      ],
    );
  }
}
