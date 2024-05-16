import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/icon/circular_icon.dart';
import 'package:purity_pallette/common/widgets/layout/grid_layout.dart';
import 'package:purity_pallette/common/widgets/loaders/animation__loader.dart';
import 'package:purity_pallette/common/widgets/loaders/shimmers/vertical_product_shimmers.dart';
import 'package:purity_pallette/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:purity_pallette/features/shop/controllers/favourite_controller.dart';
import 'package:purity_pallette/features/shop/screens/home/home.dart';
import 'package:purity_pallette/navigation_menu.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          SCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                ()=> FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, snapshot) {
                      final emptyWidget = SAnimationLoaderWidget(
                        text: "Woops Wishlist is Empty",
                        animation: SImages.SAnimationImage,
                        showAction: true,
                        actionText: 'Lets add some',
                        onActionPressed: () => Get.off(() => NavigationMenu()),
                      );
                      const loader = SVerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget = SHelperFunction.checkMultiRecordState(
                          snapshot: snapshot,
                          loader: loader,
                          nothingFound: emptyWidget);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return SGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => SProductCardVerticalWidget(
                              product: products[index]));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
