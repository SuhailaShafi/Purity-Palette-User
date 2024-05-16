import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/loaders/shimmers/shimmer.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget(
      {super.key,
      this.fit = BoxFit.cover,
      required this.images,
      this.isNetworkImage = false,
      this.overlaycolor,
      this.backgroundColor,
      this.padding = SSizes.sm,
      this.width = 56,
      this.height = 56,
      this.applyradius = true});
  final BoxFit? fit;
  final String images;
  final bool isNetworkImage;
  final Color? overlaycolor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool applyradius;

  @override
  Widget build(BuildContext context) {
    print(images);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: SHelperFunction.isDarkMode(context)
              ? Colors.black
              : Colors.white),
      child: applyradius
          ? ClipOval(
              // Clip the image to a circular shape
              child: isNetworkImage
                  ? Image.network(images, fit: fit)
                  : Image.asset(images, fit: fit),
            )
          : isNetworkImage
              ? Image.network(images, fit: fit)
              : Image.asset(images, fit: fit),
    );
  }
}
