import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/appbar/appbar.dart';
import 'package:purity_pallette/features/personalization/controllers/udate_name_controller.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: SAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: SSizes.spaceBtwnSections,
            ), //TextField and Button/
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          SValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwnInputFields,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          SValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwnSections,
                    ),
                    //Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => controller.updateUserName(),
                          child: const Text('save')),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
