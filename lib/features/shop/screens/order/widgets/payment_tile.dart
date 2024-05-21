import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/features/shop/controllers/checkout_controller.dart';
import 'package:purity_pallette/features/shop/model/orders/payment_method_model.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SPaymentTile extends StatelessWidget {
  const SPaymentTile({super.key, required this.paymentMethod});
  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: CircularContainerWidget(
        width: 60,
        height: 40,
        backgroundColor: SHelperFunction.isDarkMode(context)
            ? Color.fromARGB(255, 220, 217, 217)
            : SColors.backgroundWhite,
        padding: EdgeInsets.all(SSizes.sm),
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: Icon(Iconsax.arrow_right_14),
    );
  }
}
