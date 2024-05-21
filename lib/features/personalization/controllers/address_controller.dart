import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/common/widgets/texts/section_heading.dart';
import 'package:purity_pallette/data/repositories/user/address_repositories.dart';
import 'package:purity_pallette/features/personalization/models/address_model.dart';
import 'package:purity_pallette/features/personalization/screens/address/widgets/add_address.dart';
import 'package:purity_pallette/features/personalization/screens/address/widgets/single_address.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';
import 'package:purity_pallette/utils/internet/network_manager.dart';
import 'package:purity_pallette/utils/popup/full_screen_loader.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  //
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

//
  RxBool refreshData = true.obs;
  final addressRepository = Get.put(AddressReppository());
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

//Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularProgressIndicator(),
      );
      //chear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      //Assign selected Address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      //select the selected field to true for the newlt selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      SLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

//Add new address
  Future addNewAddress() async {
    try {
      //start loading
      SFullScreenLoader.openLoadingDialog(
          'Storing Address...', SImages.SAnimationImage);
      //check internet connectivity
      final isConnected = await Networkmanager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoaduing();
        return;
      } //formvalidation
      if (!addressFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoaduing();
        return;
      }
      //save address data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);
      //update selected address status
      address.id = id;
      await selectAddress(address);
      //remove loader
      SFullScreenLoader.stopLoaduing();
      //show sucess snackbar
      SLoaders.successSnackBar(
          title: 'congratulations',
          message: 'Your address have been added successfully');
      //refresh address data
      refreshData.toggle();
      //reset fields
      resetFormFields();
      //redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      SFullScreenLoader.stopLoaduing();
      SLoaders.errorSnackBar(
          title: 'Address not found ', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.all(SSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SSectionHeadingWidget(
              title: "Select Address",
              showActionButton: false,
            ),
            FutureBuilder(
              future: getAllUserAddresses(),
              builder: (_, snapshot) {
                final response =
                    SHelperFunction.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => SSingleAddress(
                        onTap: () async {
                          await selectAddress(snapshot.data![index]);
                          Get.back();
                        },
                        address: snapshot.data![index]));
              },
            ),
            const SizedBox(height: SSizes.defaultSpace),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => AddNewAddressScreen()),
                child: Text('Add new address'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
