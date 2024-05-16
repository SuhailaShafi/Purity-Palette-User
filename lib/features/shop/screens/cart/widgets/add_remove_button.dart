import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/icon/circular_icon.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class AddRemoveButton extends StatelessWidget {
  const AddRemoveButton(
      {super.key, required this.quantity, this.add, this.remove});
  final int quantity;
  final VoidCallback? add, remove;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Add remove buttons

        SizedBox(width: 70),
        SCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: SSizes.md,
          color: SHelperFunction.isDarkMode(context)
              ? SColors.backgroundWhite
              : Colors.black,
          backgroundColor: SHelperFunction.isDarkMode(context)
              ? SColors.textgrey
              : SColors.backgroundWhite,
          onPressed: remove,
        ),
        SizedBox(width: SSizes.spaceBtwnItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: SSizes.spaceBtwnItems),
        SCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: SSizes.md,
          color: SColors.backgroundWhite,
          backgroundColor: SColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
