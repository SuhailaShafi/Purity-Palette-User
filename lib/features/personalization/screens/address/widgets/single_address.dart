import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/features/personalization/controllers/address_controller.dart';
import 'package:purity_pallette/features/personalization/models/address_model.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SSingleAddress extends StatelessWidget {
  const SSingleAddress({
    super.key,
    required this.onTap,
    required this.address,
  });
  final VoidCallback onTap;
  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = SHelperFunction.isDarkMode(context);
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: CircularContainerWidget(
          padding: EdgeInsets.all(SSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? SColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? SColors.backgroundDark
                  : Colors.grey,
          margin: EdgeInsets.only(bottom: SSizes.spaceBtwnItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? SColors.backgroundWhite
                          : SColors.backgroundDark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: SSizes.sm / 2),
                  Text(address.phoneNumber,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: SSizes.sm / 2),
                  Text(address.toString(), softWrap: true),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
