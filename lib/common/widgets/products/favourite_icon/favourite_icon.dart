import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/icon/circular_icon.dart';
import 'package:purity_pallette/features/shop/controllers/favourite_controller.dart';
import 'package:purity_pallette/utils/constants/colors.dart';

class SFavouriteIcon extends StatelessWidget {
  const SFavouriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() {
      return SCircularIcon(
          icon: controller.isFavourites(productId)
              ? Iconsax.heart5
              : Iconsax.heart,
          color: controller.isFavourites(productId) ? SColors.primary : null,
          onPressed: () {
            print('togle....................');
            return controller.toggleFavouriteProduct(productId);
          });
    });
  }
}
