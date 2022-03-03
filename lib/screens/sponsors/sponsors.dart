import 'package:flutter/material.dart';

import 'package:football_app/Utils/constants.dart';

class SponsorsView extends StatelessWidget {
  const SponsorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        backgroundColor: kPrimeColor,
        title: const Text(
          "Sponsors",
          style: TextStyle(color: kLightColor),
        ),
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  SponsorsCard(
                    img:
                        "https://lifebeyondsportmedia.com/bestanden/Football-Sponsors/redbull.jpg",
                    heading: "RedBull",
                    link: "https://www.redbull.com/pk-en/",
                    desc:
                        "SRLR Srama Rugby League Rebounder Rugby League, Rugbgy union, Touch Football, sports ball is designed to bounce back",
                  ),
                  SponsorsCard(
                    img:
                        "https://lifebeyondsportmedia.com/bestanden/Football-Sponsors/Pepsi.png",
                    heading: "Pepsi",
                    link: "https://www.pepsico.com/",
                    desc:
                        "SRLR Srama Rugby League Rebounder Rugby League, Rugbgy union, Touch Football, sports ball is designed to bounce back",
                  ),
                  SponsorsCard(
                    img:
                        "https://lifebeyondsportmedia.com/bestanden/Football-Sponsors/Nike.jpg",
                    heading: "Nike",
                    link: "https://www.nike.com/",
                    desc:
                        "SRLR Srama Rugby League Rebounder Rugby League, Rugbgy union, Touch Football, sports ball is designed to bounce back",
                  ),
                  SponsorsCard(
                    img:
                        "https://lifebeyondsportmedia.com/bestanden/Football-Sponsors/Samsung.jpg",
                    heading: "Samsung",
                    link: "https://www.samsung.com/pk/",
                    desc:
                        "SRLR Srama Rugby League Rebounder Rugby League, Rugbgy union, Touch Football, sports ball is designed to bounce back",
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class SponsorsCard extends StatelessWidget {
  const SponsorsCard({
    Key? key,
    required this.img,
    required this.heading,
    required this.link,
    required this.desc,
  }) : super(key: key);

  final String img;
  final String heading;
  final String link;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              img,
              fit: BoxFit.contain,
              height: 170,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            heading,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            link,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            desc,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: kDarkLightColor,
            height: 2,
          )
        ],
      ),
    );
  }
}
