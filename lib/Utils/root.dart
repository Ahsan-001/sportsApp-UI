import 'package:football_app/Controlller/authcontroller.dart';
import 'package:football_app/Model/user.dart';
import 'package:football_app/screens/Authentication/signin.dart';
import 'package:football_app/widgets/navbar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class Root extends GetWidget<AuthController> {
  UserModel? myuser;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().currentUser != null)
          ? NavBar()
          : SignIn();
    });
  }
}
