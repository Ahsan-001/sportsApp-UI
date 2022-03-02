import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/Controlller/authcontroller.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  var isLoading = false.obs;
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimeColor,
        title: const Text(
          "Reset Password",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: kLightColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/fPassword.svg',
                    width: 250,
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Forget Password?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Enter your email to reset password.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: email,
                      cursorColor: kDarkColor,
                      decoration: InputDecoration(
                        fillColor: kDarkLightColor,
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email,
                          color: kPrimeColor,
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Obx(() => Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: kDarkColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: isLoading.value
                            ? CircularProgressIndicator()
                            : MaterialButton(
                                onPressed: () async {
                                  isLoading.value = true;
                                  if (GetUtils.isEmail(email.text)) {
                                    await Get.find<AuthController>()
                                        .resetPassword(email.text);
                                  } else {
                                    Get.snackbar('Error', 'Enter valid Email.');
                                  }
                                  isLoading.value = false;
                                },
                                child: const Text(
                                  "Sent Reset Link",
                                  style: TextStyle(
                                      color: kLightColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                      )),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
