import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/success_screen/success_screen.dart';
import 'package:purity_pallette/features/shop/controllers/cart_controller.dart';
import 'package:purity_pallette/features/shop/controllers/checkout_controller.dart';
import 'package:purity_pallette/features/shop/controllers/order_controller.dart';
import 'package:purity_pallette/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:purity_pallette/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:purity_pallette/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:purity_pallette/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:purity_pallette/features/shop/screens/checkout/widgets/coupon_code.dart';
import 'package:purity_pallette/navigation_menu.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = controller.orderTotalrice();
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: SAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              SCartItems(showAddRemoveItems: false),
              SizedBox(height: SSizes.spaceBtwnSections),

              //coupon textfield
              SCouponCode(),
              SizedBox(height: SSizes.spaceBtwnSections),

              //Billing section
              CircularContainerWidget(
                showBorder: true,
                padding: EdgeInsets.all(SSizes.md),
                backgroundColor: dark ? Colors.black : SColors.backgroundWhite,
                child: Column(
                  children: [
                    //pricing
                    SAmountSection(),
                    SizedBox(height: SSizes.spaceBtwnItems),
                    //divider
                    Divider(),
                    SizedBox(height: SSizes.spaceBtwnItems),
                    //payment methods
                    BillingPaymentSection(),
                    SizedBox(height: SSizes.spaceBtwnItems),
                    //Address
                    BillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => subTotal > 0
                ? orderController.processOrder(totalAmount)
                : SLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart to proceed'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Checkout'),
                Icon(Icons.currency_rupee),
                Text('${totalAmount}'),
              ],
            )),
      ),
    );
  }
}
