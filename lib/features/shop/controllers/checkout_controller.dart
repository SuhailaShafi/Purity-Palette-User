import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/shop/model/orders/payment_method_model.dart';
import 'package:purity_pallette/features/shop/screens/order/widgets/payment_tile.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;
  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: SImages.ImgPayPal, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(SSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SSectionHeadingWidget(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              SizedBox(height: SSizes.spaceBtwnSections),
              SPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: SImages.ImgPayPal, name: 'Paypal')),
              SizedBox(height: SSizes.spaceBtwnItems / 2),
              SPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: SImages.ImggooglePay, name: 'Google Pay')),
              SizedBox(height: SSizes.spaceBtwnItems / 2),
              SPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: SImages.ImgapplePay, name: 'Apple Pay')),
              SizedBox(height: SSizes.spaceBtwnItems / 2),
              SPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(image: SImages.ImgVisa, name: 'VISA')),
              SizedBox(height: SSizes.spaceBtwnItems / 2),
              SPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: SImages.ImgmasterCard, name: 'Master Card')),
              SizedBox(height: SSizes.spaceBtwnItems / 2),
              SPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: SImages.ImgPaytm, name: 'Paytm')),
              SizedBox(height: SSizes.spaceBtwnItems / 2),
              SPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: SImages.ImgPayStack, name: 'Paystack')),
              SizedBox(height: SSizes.spaceBtwnItems / 2),
              SPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: SImages.ImgcreditCard, name: 'Credit Card')),
              SizedBox(height: SSizes.spaceBtwnItems / 2),
            ],
          ),
        ),
      ),
    );
  }
}
