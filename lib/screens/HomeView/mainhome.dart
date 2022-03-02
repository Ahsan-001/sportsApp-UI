import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/screens/AbousUS/abousUs.dart';

import 'package:football_app/screens/PlayerProfiles/profileView.dart';
import 'package:football_app/screens/SocialMediaLinks/socialAppLinks.dart';
import 'package:football_app/screens/SportsView/leagueScreen.dart';
import 'package:football_app/screens/SportsView/tabView.dart';

import 'package:football_app/screens/UserProfile/edit_profile.dart';
import 'package:football_app/screens/chatView/homeChat.dart';
import 'package:football_app/screens/sponsors/sponsors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kLightColor,
        actions: [
          IconButton(
            onPressed: () => Get.to(EditProfile()),
            icon: Icon(
              Icons.settings,
              color: kPrimeColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                    fit: BoxFit.contain,
                    color: kPrimeColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Exposure for Everyone",
                    style: TextStyle(
                      color: kPrimeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "#AchieveTheDream",
                    style: TextStyle(
                      color: kPrimeColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SportsCard(
                        lable: "News & Feed",
                      ),
                      SportsCard(
                        lable: "Sports",
                        ontap: () => {
                          Get.to(const TabsView()),
                        },
                      ),
                      SportsCard(
                        lable: "Profiles",
                        ontap: () => {
                          Get.to(
                            Profiles(),
                          ),
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SportsCard(
                        lable: "Chat",
                        ontap: () => {
                          Get.to(
                            ChatHome(),
                          ),
                        },
                      ),
                      SportsCard(
                        lable: "Social Media",
                        ontap: () => {
                          Get.to(const SocialLinks()),
                        },
                      ),
                      SportsCard(
                        lable: "Sponsors",
                        ontap: () => {
                          Get.to(const SponsorsView()),
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SportsCard(
                        lable: "Invest or Donate",
                      ),
                      SportsCard(
                        lable: "Online Store",
                        ontap: () async {
                          await launch("https://sportstalentscout.com/");
                        },
                      ),
                      SportsCard(
                        lable: "About Us",
                        ontap: () {
                          showDialog(
                            context: context,
                            builder: (_) => const AboutUsView(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SportsCard extends StatelessWidget {
  final String? lable;
  final String? urlLink;
  VoidCallback? ontap;

  SportsCard({Key? key, this.lable, this.ontap, this.urlLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: kPrimeColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 1,
                offset: const ui.Offset(0, 3)),
          ],
        ),
        height: 100,
        width: 100,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: Image.asset(
                'assets/images/$lable.png',
                color: kLightColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              lable!,
              textAlign: ui.TextAlign.center,
              style: const TextStyle(color: kLightColor),
            ),
          ],
        ),
      ),
    );
  }
}
