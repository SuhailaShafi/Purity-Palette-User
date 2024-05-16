import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';
import 'package:shimmer/shimmer.dart';

class SShimmerEffect extends StatelessWidget {
  const SShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.color,
      this.radius = 15});
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ??
                (dark ? SColors.backgroundDark : SColors.backgroundWhite),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
