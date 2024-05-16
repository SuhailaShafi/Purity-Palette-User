import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purity_pallette/data/repositories/user/user_repository.dart';
import 'package:purity_pallette/features/authentication/screens/login/login.dart';
import 'package:purity_pallette/features/authentication/screens/onboarding/onboarding.dart';
import 'package:purity_pallette/features/authentication/screens/signup/verify_email.dart';
import 'package:purity_pallette/navigation_menu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:purity_pallette/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

//variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
//get authenticated userdata
  User? get authUser => _auth.currentUser;

//called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

//function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        //initialize user specific storage
        await SLocalStorage.init(user.uid);
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => Verifyemail(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      //local storage

      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

//[Email authentication ]--SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e;
    } on FirebaseException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

//[Email authentication ]--Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e;
    } on FirebaseException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

//[Reauthenticate ]--Reauthenticate user
//[Email authentication ]--Mail verification
  Future<void> sedEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw e;
    } on FirebaseException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

//Reauthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      //create acredential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      //reAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      throw 'something went wrong, lease try again';
    }
  }
//[Email authentication ]--Forget password

//Google signin
  Future<UserCredential?> signinWithGoogle() async {
    try {
      //triggertheauthenticationflow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

//Contain the auth details from the request/
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

//create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //once signed in return the user credential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw e;
    } on FirebaseException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      if (kDebugMode) print('Something went wrong, Please try again,$e');
      return null;
    }
  }

//[Logout User]-Valid for any authentication
  Future<void> logout() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e;
    } on FirebaseException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

//[Delete User] Remove user auth and firestore account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } catch (e) {
      throw 'something went wrong , please try again';
    }
  }
}
