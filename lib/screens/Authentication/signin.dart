import 'package:flutter/material.dart';
import 'package:football_app/Controlller/authcontroller.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/main.dart';
import 'package:football_app/screens/Authentication/forgot_password.dart';
import 'package:football_app/screens/Authentication/signup.dart';
import 'package:football_app/screens/Authentication/textfield_widget.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final isObsecure = true.obs;
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: kWidth,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(spreadRadius: 3, blurRadius: 10),
              ],
            ),
            child: Scaffold(
                body: Container(
              color: kLightColor,
              height: height,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/bub1.png",
                      width: width,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 60.0, right: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 40.0,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: h1HeadingBlack,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          Image.asset(
                            "assets/images/logo.png",
                            height: height * 0.155,
                          ),
                          SizedBox(height: height * 0.075),
                          TextFieldWidget(
                            obsecure: false,
                            controller: emailController,
                            leadingIcon: Icons.mail,
                            lable: 'Enter Email',
                          ),
                          const SizedBox(height: 15),
                          Obx(() => TextFieldWidget(
                                controller: passwordController,
                                leadingIcon: Icons.lock,
                                lable: 'Enter Password',
                                obsecure: isObsecure.value,
                                trailing: isObsecure.value
                                    ? IconButton(
                                        onPressed: () {
                                          isObsecure.value = false;
                                        },
                                        icon: const Icon(
                                          Icons.password,
                                          color: kPrimeColor,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          isObsecure.value = true;
                                        },
                                        icon: const Icon(
                                          Icons.remove_red_eye,
                                          color: kPrimeColor,
                                        ),
                                      ),
                              )),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.only(right: 15),
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => ForgotPassword());
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: MaterialButton(
                                height: 60.0,
                                color: kPrimeColor,
                                onPressed: () async {
                                  isLoading.value = true;
                                  if (GetUtils.isEmail(emailController.text)) {
                                    authController.login(emailController.text,
                                        passwordController.text);
                                  } else {
                                    Get.snackbar(
                                        "Input Error", 'Enter Valid Data',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.redAccent);
                                  }
                                  isLoading.value = false;
                                },
                                child: isLoading.value
                                    ? const CircularProgressIndicator(
                                        color: Colors.black,
                                      )
                                    : const Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            color: kLightColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            letterSpacing: 2),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Don’t have an Account ? ",
                                style: TextStyle(
                                  color: kDarkColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => SignupView());
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: kPrimeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
