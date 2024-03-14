import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purity_pallette/app.dart';
import 'package:purity_pallette/firebase_options.dart';

Future<void> main() async {
  //Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///Getx local storage
  await GetStorage.init();

  //Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //.then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}
