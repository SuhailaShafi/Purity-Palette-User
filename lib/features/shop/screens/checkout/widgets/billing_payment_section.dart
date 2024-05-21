import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/shop/controllers/checkout_controller.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = SHelperFunction.isDarkMode(context);
    return Column(
      children: [
        SSectionHeadingWidget(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
          showActionButton: true,
        ),
        SizedBox(height: SSizes.spaceBtwnItems / 2),
        Obx(
          () => Row(
            children: [
              CircularContainerWidget(
                width: 60,
                height: 35,
                backgroundColor:
                    dark ? SColors.backgroundWhite : SColors.backgroundWhite,
                padding: EdgeInsets.all(SSizes.sm),
                child: Image(
                  image:
                      AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: SSizes.spaceBtwnItems / 2,
              ),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
