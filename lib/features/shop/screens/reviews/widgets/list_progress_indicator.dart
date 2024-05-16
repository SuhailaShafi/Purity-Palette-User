import 'package:flutter/material.dart';
import 'package:purity_pallette/features/shop/screens/reviews/widgets/rating_progress_indicator.dart';

class ProductRatingProgressList extends StatelessWidget {
  const ProductRatingProgressList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 3,
          child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
      Expanded(
          flex: 7,
          child: Column(children: [
            SRatingProgressIndicator(number: '5', value: 0.7),
            SRatingProgressIndicator(number: '4', value: 0.6),
            SRatingProgressIndicator(number: '3', value: 0.5),
            SRatingProgressIndicator(number: '2', value: 0.2),
            SRatingProgressIndicator(number: '1', value: 0.1),
          ]))
    ]);
  }
}
