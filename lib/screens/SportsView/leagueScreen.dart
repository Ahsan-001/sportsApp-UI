import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:football_app/Utils/constants.dart';

class LeagueView extends StatelessWidget {
  const LeagueView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  ProfileMenu(
                      text: "Emerging Nation Rugby League",
                      icon: "assets/images/league.png"),
                  ProfileMenu(
                    text: "Rugby League",
                    icon: "assets/images/league.png",
                  ),
                  ProfileMenu(
                    text: "Rugby Union",
                    icon: "assets/images/league.png",
                  ),
                  ProfileMenu(
                    text: "Champions League",
                    icon: "assets/images/league.png",
                  ),
                  ProfileMenu(
                    text: "Spanish Laliga",
                    icon: "assets/images/league.png",
                  ),
                  ProfileMenu(
                    text: "UEFA Champion League",
                    icon: "assets/images/league.png",
                  ),
                  ProfileMenu(
                    text: "English Premier League",
                    icon: "assets/images/league.png",
                  ),
                  ProfileMenu(
                    text: "Mexican Liga",
                    icon: "assets/images/league.png",
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // side: BorderSide.none,
            ),
            backgroundColor: Colors.black12),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(text, style: const TextStyle(fontSize: 17)),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
