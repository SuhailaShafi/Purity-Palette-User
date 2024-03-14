import 'package:flutter/material.dart';
import 'package:purity_pallette/utils/constants/colors.dart';

class CircularContainerWidget extends StatelessWidget {
  const CircularContainerWidget(
      {super.key,
      this.radius = 400,
      this.padding = 0,
      this.backgroundColor = SColors.backgroundWhite,
      this.width = 400,
      this.height = 400,
      this.child});
  final double? width, height;
  final double radius, padding;
  final Widget? child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
