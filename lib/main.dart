import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:football_app/Bindings/authBinding.dart';
import 'package:football_app/Controlller/authcontroller.dart';
import 'package:football_app/Controlller/chatRoomController.dart';
import 'package:football_app/Controlller/userController.dart';
import 'package:football_app/Utils/root.dart';
import 'package:get/get.dart';

var kWidth = Get.width;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut(() => UserController());
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => ChatRoomControlller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sports Talent Scout',
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}
