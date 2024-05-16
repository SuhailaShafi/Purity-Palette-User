import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:purity_pallette/data/repositories/user/user_repository.dart';
import 'package:purity_pallette/features/personalization/controllers/user_controller.dart';
import 'package:purity_pallette/features/personalization/screens/profile/profile.dart';
import 'package:purity_pallette/utils/internet/network_manager.dart';
import 'package:purity_pallette/utils/popup/full_screen_loader.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userReository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
//init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

//fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      print('clicked save button');
      //start loading
      SFullScreenLoader.openLoadingDialog('We are udating your information...',
          "assets/animation_loading.json");
      print('object');
      //Check internet connectivity
      final isConnected = await Networkmanager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoaduing();
        return;
      } //formvalidation
      if (!updateUserNameFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoaduing();
        return;
      }
      print('updating..');
      //update users first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userReository.updateSingleField(name);
      //udate the RX user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      //remove loader
      SFullScreenLoader.stopLoaduing();
      //Show success message
      SLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated');
      //move to previos screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      SFullScreenLoader.stopLoaduing();
      SLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
