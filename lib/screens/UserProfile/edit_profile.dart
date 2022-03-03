import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/Controlller/authcontroller.dart';
import 'package:football_app/Controlller/userController.dart';
import 'package:football_app/Services/database.dart';
import 'package:football_app/Services/firebase_storage_service.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/screens/AbousUs/abousUs.dart';
import 'package:football_app/screens/Authentication/signin.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatelessWidget {
  // final authController = Get.find<AuthController>();
  // final userController = Get.find<UserController>();

  EditProfile({Key? key}) : super(key: key);

  late File image;
  final imageIsNull = true.obs;

  final isUploading = false.obs;
  chooseImage() async {
    final imgPicker = ImagePicker();
    try {
      PickedFile? pickedFile = await imgPicker.getImage(
          source: ImageSource.gallery, imageQuality: 20);
      image = File(pickedFile!.path);
      imageIsNull.value = false;
    } catch (e) {
      imageIsNull.value = true;
      Get.snackbar('Error', 'Select an Image to Upload');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kLightColor,
        appBar: AppBar(
            // backgroundColor: AppColors().kappbarColor,
            backgroundColor: kPrimeColor,
            elevation: 0,
            title: const Text("Edit Profile"),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new),
                color: kLightColor,
                iconSize: 20,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MaterialButton(
                  onPressed: () {
                    // authController.signOut();
                    Get.offAll(SignIn());
                  },
                  child: const Icon(
                    Icons.logout_outlined,
                    color: kLightColor,
                  ),
                ),
              ),
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 0.0),
                            child: Container(
                                height: 110.0,
                                width: 110.0,
                                decoration: BoxDecoration(
                                    color: kDarkColor,
                                    borderRadius: BorderRadius.circular(60)),
                                padding: const EdgeInsets.all(2),
                                child:
                                    //  Obx(
                                    //   () => ClipRRect(
                                    //     borderRadius: BorderRadius.circular(60),
                                    //     child: isUploading.value
                                    //         ? const Center(
                                    //             child: CircularProgressIndicator(),
                                    //           )
                                    //         : Image.network(
                                    //             userController.userGetter.photoUrl!,
                                    //             fit: BoxFit.cover,
                                    //             loadingBuilder: (BuildContext context,
                                    //                 Widget child,
                                    //                 ImageChunkEvent?
                                    //                     loadingProgress) {
                                    //               if (loadingProgress == null) {
                                    //                 return child;
                                    //               }
                                    //               return Center(
                                    //                 child: CircularProgressIndicator(
                                    //                   value: loadingProgress
                                    //                               .expectedTotalBytes !=
                                    //                           null
                                    //                       ? loadingProgress
                                    //                               .cumulativeBytesLoaded /
                                    //                           loadingProgress
                                    //                               .expectedTotalBytes!
                                    //                       : null,
                                    //                 ),
                                    //               );
                                    //             },
                                    //             errorBuilder: (BuildContext context,
                                    //                 Object exception,
                                    //                 StackTrace? stackTrace) {
                                    //               return SvgPicture.asset(
                                    //                 'assets/images/user.svg',
                                    //                 width: 122,
                                    //               );
                                    //             },
                                    //           ),
                                    //   ),
                                    // ),

                                    Container(
                                  child: Image.asset(
                                    'assets/images/user.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                )),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 3,
                                  color: kPrimeColor,
                                ),
                                color: kDarkColor,
                              ),
                              height: 35,
                              width: 35,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // await chooseImage();
                                    // if (imageIsNull.value == false) {
                                    //   isUploading.value = true;
                                    //   String url = await Storage()
                                    //       .imageUploadToStorage(image);
                                    //   await Database().updateProfilePic(url);
                                    //   isUploading.value = false;
                                    // }
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                EditProfileCard(
                  text: "Notifications",
                  icon: "assets/images/Bell.svg",
                  press: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                EditProfileCard(
                  text: "Setting Account",
                  icon: "assets/images/Settings.svg",
                  press: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                EditProfileCard(
                  text: "Help Center",
                  icon: "assets/images/Question mark.svg",
                  press: () {},
                ),
                const SizedBox(
                  height: 5,
                ),
                EditProfileCard(
                  text: "About Application",
                  icon: "assets/images/info.svg",
                  press: () => {Get.to(AboutUsView())},
                ),
                const SizedBox(
                  height: 5,
                ),
                EditProfileCard(
                  text: "Log Out",
                  icon: "assets/images/Log out.svg",
                  press: () {
                    // authController.signOut();
                    Get.offAll(SignIn());
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class EditProfileCard extends StatelessWidget {
  const EditProfileCard({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          // side: BorderSide.none,
        ),
        backgroundColor: kPrimeColor,
      ),
      onPressed: press,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: kLightColor,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: kLightColor,
          ),
        ],
      ),
    );
  }
}
