import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/images/s_rounded_image.dart';
import 'package:purity_pallette/features/personalization/controllers/address_controller.dart';
import 'package:purity_pallette/features/personalization/screens/address/widgets/add_address.dart';
import 'package:purity_pallette/features/personalization/screens/address/widgets/single_address.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: SColors.primary,
          onPressed: () => Get.to(() => AddNewAddressScreen()),
          child: Icon(
            Iconsax.add,
            color: Colors.white,
          ),
        ),
        appBar: SAppBar(
          showBackArrow: true,
          title: Text(
            'Addresses',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
              children: [
                Obx(
                  () => FutureBuilder(
                      key: Key(controller.refreshData.value.toString()),
                      future: controller.getAllUserAddresses(),
                      builder: (context, snapshot) {
                        final response = SHelperFunction.checkMultiRecordState(
                            snapshot: snapshot);
                        if (response != null) return response;
                        final addresses = snapshot.data!;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: addresses.length,
                            itemBuilder: (_, index) => SSingleAddress(
                                  address: addresses[index],
                                  onTap: () => controller
                                      .selectAddress(addresses[index]),
                                ));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
