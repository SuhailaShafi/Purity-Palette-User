import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/features/personalization/controllers/address_controller.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SSectionHeadingWidget(
            title: 'Shiping Address',
            buttonTitle: 'Change',
            onPressed: () => controller.selectNewAddressPopup(context),
            showActionButton: true,
          ),
          controller.selectedAddress.value.id.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SSizes.spaceBtwnItems / 2),
                    Text(
                      controller.selectedAddress.value.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: SSizes.spaceBtwnItems / 2),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.grey, size: 16),
                        SizedBox(width: SSizes.spaceBtwnItems),
                        Text(
                          controller.selectedAddress.value.phoneNumber,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    SizedBox(height: SSizes.spaceBtwnItems / 2),
                    Row(
                      children: [
                        Icon(Icons.location_history,
                            color: Colors.grey, size: 16),
                        SizedBox(width: SSizes.spaceBtwnItems),
                        Expanded(
                          child: Text(
                            controller.selectedAddress.value.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: SSizes.spaceBtwnItems / 2),
                  ],
                )
              : Text(
                  'Select Address',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
        ],
      ),
    );
  }
}
