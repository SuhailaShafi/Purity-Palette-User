import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SAnimationLoaderWidget extends StatelessWidget {
  const SAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(animation, width: MediaQuery.sizeOf(context).width * 0.8),
        SizedBox(height: SSizes.defaultSpace),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: SSizes.defaultSpace,
        ),
        showAction
            ? SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: SColors.backgroundDark,
                  ),
                  child: Text(
                    actionText!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.white),
                  ),
                ),
              )
            : SizedBox()
      ],
    ));
  }
}
