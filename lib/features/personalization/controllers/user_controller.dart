import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purity_pallette/data/repositories/authentication/authentication-repository.dart';
import 'package:purity_pallette/data/repositories/user/user_repository.dart';
import 'package:purity_pallette/features/authentication/models/user_model/user_model.dart';
import 'package:purity_pallette/features/authentication/screens/login/login.dart';
import 'package:purity_pallette/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:purity_pallette/utils/constants/image_strings.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/internet/network_manager.dart';
import 'package:purity_pallette/utils/popup/full_screen_loader.dart';
import 'package:purity_pallette/utils/popup/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

//Fetch user record/
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

//save user records from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //refresh user record,first update Rx user and then check if user data is stored. if not store new data/
      await fetchUserRecord();
//if no record already stored/
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //convert  name into first and lastname
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUserName(
              userCredential.user!.displayName ?? '');
          //map data
          final user = UserModel(
              id: userCredential.user!.uid,
              email: userCredential.user!.email ?? '',
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
              userName: username,
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePictureUrl: userCredential.user!.photoURL ?? '');
          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      SLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can resave your data in your profile');
    }
  }

  ///Delete account warning
  void deleteteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(SSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account ppermanently?',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: Text('Cancel')));
  }

//delete user account
  void deleteUserAccount() async {
    try {
      SFullScreenLoader.openLoadingDialog('Processing', SImages.successImage);
      //first reauthenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //re verify auth email
        if (provider == 'google.com') {
          await auth.signinWithGoogle();
          await auth.deleteAccount();
          SFullScreenLoader.stopLoaduing();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          SFullScreenLoader.stopLoaduing();
          Get.to(() => ReAuthloginform());
        }
      }
    } catch (e) {
      SFullScreenLoader.stopLoaduing();
      SLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

//re Authenticate before deleting
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      SFullScreenLoader.openLoadingDialog(
          'Processing', 'assets/animation_loading.json');
      print('loading');
      //Check internet connectivity
      final isConnected = await Networkmanager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoaduing();
        return;
      } //formvalidation
      if (!reAuthFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoaduing();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      SFullScreenLoader.stopLoaduing();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      SFullScreenLoader.stopLoaduing();
      SLoaders.warningSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  final imageuploading = false.obs;
//upload profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageuploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile', image);
        //update user image record
        Map<String, dynamic> json = {"profilePictureUrl": imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePictureUrl = imageUrl;
        SLoaders.successSnackBar(
            title: "Congratulations",
            message: "your profile image has been uploaded");
      }
    } catch (e) {
      SLoaders.errorSnackBar(
          title: "Oh snap", message: "Something went wrong: $e");
    } finally {
      imageuploading.value = false;
    }
  }
}
