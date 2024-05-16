import 'package:flutter/material.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class CircularContainerWidget extends StatelessWidget {
  const CircularContainerWidget(
      {super.key,
      this.radius = SSizes.cardRadiusLg,
      this.padding,
      this.backgroundColor = SColors.backgroundWhite,
      this.width,
      this.height,
      this.child,
      this.margin,
      this.showBorder = false,
      this.borderColor = Colors.grey});
  final double? width, height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: showBorder
            ? Border.all(
                color: borderColor,
              )
            : null,
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
