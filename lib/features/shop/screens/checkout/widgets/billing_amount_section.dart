import 'package:flutter/material.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/utils/constants/icons.dart';
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
            PriceWidget(icon: SIcons.rupee_sm, amount: subTotal.toString())
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            PriceWidget(icon: SIcons.rupee_sm, amount: '100')
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            PriceWidget(icon: SIcons.rupee_sm, amount: '100')
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            PriceWidget(
                icon: SIcons.rupee_sm,
                amount: '${cartController.orderTotalrice()}')
          ],
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
      ],
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.icon, required this.amount});
  final Icon icon;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SIcons.rupee_sm,
        Text('$amount', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
