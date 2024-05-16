import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SearchContainerWidget extends StatelessWidget {
  const SearchContainerWidget(
      {super.key,
      this.icon = Iconsax.search_normal,
      required this.text,
      this.showBackground = true,
      this.showBorder = true,
      this.padding =
          const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace)});
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: SHelperFunction.ScreenWidth(),
        padding: EdgeInsets.all(SSizes.md),
        decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? SColors.backgroundDark
                    : Colors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(SSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: SColors.textgrey) : null),
        child: Row(
          children: [
            Icon(icon, color: SColors.textgrey),
            SizedBox(
              width: SSizes.spaceBtwnItems,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
