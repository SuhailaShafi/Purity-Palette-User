import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductPriceText extends StatelessWidget {
  ProductPriceText(
      {super.key,
      this.currencySign = Icons.currency_rupee,
      required this.price,
      this.isLarge = false,
      this.maxLines = 1,
      this.lineThrough = false});
  final IconData currencySign;
  final String price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          currencySign,
          size: 20,
        ),
        Text(
          price,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: isLarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.titleLarge!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null),
        ),
      ],
    );
  }
}
