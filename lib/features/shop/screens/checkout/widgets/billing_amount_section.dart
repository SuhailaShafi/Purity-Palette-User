import 'package:flutter/material.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SAmountSection extends StatelessWidget {
  const SAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        //Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Row(
              children: [
                Icon(Icons.currency_rupee),
                Text('$subTotal',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            )
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\Rs:100.0', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\Rs:100.0', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\Rs:100.0', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
      ],
    );
  }
}
