import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SVerticalImageTextWidget extends StatelessWidget {
  const SVerticalImageTextWidget(
      {super.key,
      required this.categoryType,
      required this.image,
      this.textColor = SColors.backgroundWhite,
      this.backgroundColor,
      this.onTap});
  final String categoryType; // Update type to String
  final String image;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SSizes.spaceBtwnItems),
        child: Column(
          children: [
            //
            //CircularIcon
            Container(
              width: 56,
              height: 56,
              //padding: EdgeInsets.all(SSizes.sm),
              //decoration: BoxDecoration(
              // color:
              //  backgroundColor ?? (dark ? Colors.black : Colors.white),
              //borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: ClipOval(child: Image.asset(image)),
              ),
            ),

            //Text
            const SizedBox(
              height: SSizes.spaceBtwnItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  categoryType,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
