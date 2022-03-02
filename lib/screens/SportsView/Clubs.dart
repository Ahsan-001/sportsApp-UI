import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:football_app/Utils/constants.dart';

class ClubView extends StatelessWidget {
  const ClubView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kLightColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  TeamCard(
                    text: "Soccer / Football",
                    icon: "assets/images/football.png",
                  ),
                  TeamCard(
                    text: "Baseball",
                    icon: "assets/images/baseball.png",
                  ),
                  TeamCard(
                    text: "Basket Ball",
                    icon: "assets/images/basketball.png",
                  ),
                  TeamCard(
                    text: "Boxing",
                    icon: "assets/images/boxing.png",
                  ),
                  TeamCard(
                      text: "Emerging Nation Rubgy League",
                      icon: "assets/images/league.png"),
                  TeamCard(
                    text: "Rubgy League",
                    icon: "assets/images/league.png",
                  ),
                  TeamCard(
                    text: "Rubgy Union",
                    icon: "assets/images/league.png",
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard({
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
