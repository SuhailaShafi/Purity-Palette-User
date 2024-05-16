import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/icon/circular_icon.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SBottomAddToCart extends StatelessWidget {
  const SBottomAddToCart(
      {super.key,
      this.icon,
      this.width,
      this.height,
      this.size,
      this.onPressed,
      this.color,
      this.backgroundColor});
  final double? width, height, size;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SSizes.defaultSpace, vertical: SSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? SColors.backgroundDark : SColors.backgroundWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SSizes.cardRadiusLg),
            topRight: Radius.circular(SSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                backgroundColor: Colors.grey,
                color: SColors.backgroundWhite,
              ),
              SizedBox(width: SSizes.spaceBtwnItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: SSizes.spaceBtwnItems),
              SCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                backgroundColor: Colors.black,
                color: SColors.backgroundWhite,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(SSizes.md),
                backgroundColor: Colors.black,
                side: BorderSide(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
