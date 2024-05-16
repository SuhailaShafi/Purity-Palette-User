import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/images/circular_image.dart';
import 'package:purity_pallette/common/widgets/texts/brand_name_with_verified_icon.dart';
import 'package:purity_pallette/features/shop/controllers/store_controller.dart';
import 'package:purity_pallette/features/shop/model/brands/brand_model.dart';
import 'package:purity_pallette/features/shop/screens/store/store.dart';
import 'package:purity_pallette/utils/constants/enums.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SBrandCard extends StatelessWidget {
  const SBrandCard({
    super.key,
    required this.brand,
    this.onTap,
    required this.showBorder,
  });

  final BrandModel brand;
  final void Function()? onTap;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    print(brand.imageUrl);
    return GestureDetector(
      onTap: onTap,
      child: CircularContainerWidget(
        padding: const EdgeInsets.all(SSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(children: [
          ///Icon

          Flexible(
            flex: 2,
            child: CircleImageWidget(
              images: brand.imageUrl,
              isNetworkImage: true,
              backgroundColor: Colors.transparent,
              overlaycolor: SHelperFunction.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          const SizedBox(
            width: SSizes.spaceBtwnItems / 2,
          ), //Text-------------
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrandTitleWithVerifiedIcon(
                  title: brand.name,
                  brandTextSizes: TextSizes.large,
                ),
                FutureBuilder(
                    future: controller.getBrandProductCount(brand.name),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is being fetched, display a loading indicator
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // If an error occurs during fetching, display an error message
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // Once data is fetched, display the product count
                        final productCount =
                            snapshot.data ?? 0; // Default to 0 if data is null
                        return Text(
                          '$productCount Products',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        );
                      }
                    })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
