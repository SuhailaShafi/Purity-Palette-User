import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/products/ratings/rating_indicator.dart';
import 'package:purity_pallette/features/shop/screens/reviews/widgets/list_progress_indicator.dart';
import 'package:purity_pallette/features/shop/screens/reviews/widgets/rating_progress_indicator.dart';
import 'package:purity_pallette/features/shop/screens/reviews/widgets/user_review_card.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/device/device_utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Ratings and reviews are verified and are free people who use the same type of device that you are'),
            SizedBox(height: SSizes.spaceBtwnItems),

            //overall product ratings
            ProductRatingProgressList(),
            SRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: SSizes.spaceBtwnSections),
            //User Reviews List
            const UserReviewCard(), UserReviewCard(), UserReviewCard()
          ],
        ),
      )),
    );
  }
}
