import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/Controlller/authcontroller.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/screens/UserProfile/edit_profile.dart';
import 'package:football_app/screens/chatView/chatRoom.dart';

import 'package:get/get.dart';

class ChatHome extends GetWidget<AuthController> {
  final List<Widget> myChats = List.generate(
    5,
    (index) => GestureDetector(
      onTap: () => Get.to(
        const ChatRoom(),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          "assets/images/user.svg",
          height: 30,
        ),
        title: Text(
          "club ${index + 1}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          "description ${index + 1}",
        ),
        trailing: Chip(
          label: Text("${index + 1}"),
        ),
      ),
    ),
  ).toList();

  ChatHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        backgroundColor: kPrimeColor,
        title: const Text("Chats"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              // color: Colors.red[900],
              child: InkWell(
                onTap: () => Get.to(EditProfile()),
                child: const Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // ignore: prefer_const_constructors
      //     Get.to(() => SearchScreen());
      //   },
      //   child: const Icon(Icons.search),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: myChats.length,
                itemBuilder: (BuildContext context, int index) =>
                    myChats[index],
              ),
            )
          ],
        ),
      ),
    );
  }
}
