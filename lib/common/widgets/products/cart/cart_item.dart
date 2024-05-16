import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/images/s_rounded_image.dart';
import 'package:purity_pallette/common/widgets/texts/brand_name_with_verified_icon.dart';
import 'package:purity_pallette/common/widgets/texts/product__title.dart';
import 'package:purity_pallette/features/shop/model/cart/cart_item_model.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SCartItem extends StatelessWidget {
  const SCartItem({super.key, required this.cartItem});
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        SRoundedImageWidget(
          imageUrl: cartItem.image1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(SSizes.sm),
          backgroundColor: SHelperFunction.isDarkMode(context)
              ? SColors.backgroundDark
              : SColors.backgroundWhite,
        ),
        SizedBox(width: SSizes.spaceBtwnItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: cartItem.brandName),
              SProductTitleText(
                title: cartItem.productName,
                maxLines: 1,
              )
            ],
          ),
        )
      ],
    );
  }
}
