import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:football_app/Utils/constants.dart';
import 'package:football_app/Model/profile.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    Key? key,
    required this.profileDetailData,
  }) : super(key: key);

  final ProfileDetailData profileDetailData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              backgroundColor: kPrimeColor,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  profileDetailData.image!,
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: Text(
                  profileDetailData.name!,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              leading: const Icon(Icons.arrow_back_ios),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: PlayerDetailStrip(
                    heading: "Email",
                    description: profileDetailData.email!,
                  ),
                ),
                PlayerDetailStrip(
                  heading: "Sport",
                  description: profileDetailData.sportName!,
                ),
                PlayerDetailStrip(
                  heading: "Height",
                  description: profileDetailData.height!,
                ),
                PlayerDetailStrip(
                  heading: "Weight",
                  description: profileDetailData.weight!,
                ),
                PlayerDetailStrip(
                  heading: "DOB",
                  description: profileDetailData.dob!,
                ),
                PlayerDetailStrip(
                  heading: "League",
                  description: profileDetailData.league!,
                ),
                PlayerDetailStrip(
                  heading: "Position",
                  description: profileDetailData.pos!,
                ),
                PlayerDetailStrip(
                  heading: "Occupation",
                  description: profileDetailData.occupation!,
                ),
                PlayerDetailStrip(
                  heading: "Passport",
                  description: profileDetailData.passport!,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  height: 100,
                  decoration: BoxDecoration(
                    color: kPrimeColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Record:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 210,
                        child: Text(
                          profileDetailData.record!,
                          style: const TextStyle(
                            color: kLightColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Social Media Links",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SocialMediaCard(
                      label: "Facebook",
                    ),
                    SocialMediaCard(
                      label: "Instagram",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SocialMediaCard(
                      label: "Twitter",
                    ),
                    SocialMediaCard(
                      label: "WhatsApp",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerDetailStrip extends StatelessWidget {
  const PlayerDetailStrip({
    Key? key,
    required this.heading,
    required this.description,
    this.profileDetailData,
  }) : super(key: key);

  final String heading;
  final String description;
  final ProfileDetailData? profileDetailData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      height: 50,
      decoration: BoxDecoration(
        color: kPrimeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              heading,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(12)),
            width: 190,
            height: 35,
            child: Center(
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    Key? key,
    required this.label,
  }) : super(
          key: key,
        );

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
