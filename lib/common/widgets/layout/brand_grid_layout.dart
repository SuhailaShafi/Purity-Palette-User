import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/images/circular_image.dart';
import 'package:purity_pallette/common/widgets/texts/brand_name_with_verified_icon.dart';
import 'package:purity_pallette/features/shop/screens/store/store.dart';
import 'package:purity_pallette/utils/constants/enums.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class BrandGridLayout extends StatelessWidget {
  const BrandGridLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircularContainerWidget(
        padding: EdgeInsets.all(SSizes.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(children: [
          ///Icon

          CircleImageWidget(
            images: 'assets/images/sunscreen.jpg',
            isNetworkImage: false,
            backgroundColor: Colors.transparent,
            overlaycolor: SHelperFunction.isDarkMode(context)
                ? Colors.white
                : Colors.black,
          ),
          SizedBox(
            width: SSizes.spaceBtwnItems / 2,
          ), //Text-------------
          Column(
            children: [
              BrandTitleWithVerifiedIcon(
                title: 'cetaphil',
                brandTextSizes: TextSizes.large,
              ),
              Text(
                '256 Products',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
