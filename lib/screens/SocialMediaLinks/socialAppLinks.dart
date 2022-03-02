import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimeColor,
        title: Text("Social Media Links"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Join ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Us ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kPrimeColor),
                  ),
                  Text(
                    "On",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SocialLinkCard(
                    label: "Facebook",
                    urlLink: "https://www.facebook.com/TheSportsTalentScout",
                  ),
                  SocialLinkCard(
                    label: "Instagram",
                    urlLink: "https://www.instagram.com/TheSportsTalentScout/",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SocialLinkCard(
                    label: "Twitter",
                    urlLink: "https://twitter.com/The_SportsScout/",
                  ),
                  SocialLinkCard(
                    label: "WhatsApp",
                    urlLink: "https://wa.link/c8zh6l",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SocialLinkCard(
                    label: "Youtube",
                    urlLink:
                        "https://www.youtube.com/channel/UCvGPahxcB9Ag01nAAmtebWQ",
                  ),
                  SocialLinkCard(
                    label: "TikTok",
                    urlLink: "https://www.tiktok.com/@thesportstalentscout",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SocialLinkCard(
                    label: "Google Reviews",
                    urlLink: "https://g.page/r/CYTT5adwFl-WEAo/review",
                  ),
                  SocialLinkCard(
                    label: "Website",
                    urlLink: "https://sportstalentscout.com/",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLinkCard extends GetView {
  const SocialLinkCard({
    required this.urlLink,
    Key? key,
    required this.label,
  }) : super(
          key: key,
        );

  final String label;
  final String urlLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launch(urlLink);
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                // blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(1, 2)),
          ],
        ),
        height: 150,
        width: 150,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
              child: SvgPicture.asset(
                'assets/images/$label.svg',
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
            ),
          ],
        ),
      ),
    );
  }
}
