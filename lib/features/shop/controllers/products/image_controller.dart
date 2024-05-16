import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/features/shop/model/products/product_model.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  ///variables
  RxString selectedProductImage = ''.obs;
//--Get all images from products and variations
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    //load thumpnail image
    images.add(product.image1);
    //Assign thumppnail as selected image
    selectedProductImage.value = product.image1;
    //get all images from the product model if not null
    images.add(product.image2);
    images.add(product.image3);
    images.add(product.brand.imageUrl);
    return images.toList();
  }

//show image popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SSizes.defaultSpace * 2,
                        horizontal: SSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: SSizes.spaceBtwnSections),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 150,
                        child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: Text('Close'),
                        ),
                      )),
                ],
              ),
            ));
  }
}
