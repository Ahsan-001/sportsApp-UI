import 'package:flutter/material.dart';
import 'package:football_app/Utils/constants.dart';

import 'package:football_app/screens/SportsView/leagueScreen.dart';
import 'package:football_app/screens/SportsView/Clubs.dart';

class TabsView extends StatelessWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = [const LeagueView(), const ClubView()];
    final _kTabs = <Tab>[
      const Tab(
        child: Text(
          "Sports",
          style: TextStyle(color: kLightColor),
        ),
      ),
      const Tab(
        child: Text(
          "Clubs",
          style: TextStyle(color: kLightColor),
        ),
      ),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          // ignore: deprecated_member_use

          backgroundColor: kPrimeColor,
          elevation: 0.0,
          toolbarHeight: 70,
          title: const Text(
            "Sports",
            style: TextStyle(color: kLightColor),
          ),
          // centerTitle: true,
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(20),
          //           bottomRight: Radius.circular(20)),
          //       gradient: LinearGradient(
          //           colors: [Colors.white, Colors.white],
          //           begin: Alignment.bottomCenter,
          //           end: Alignment.topCenter)),
          // ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.search, color: kLightColor),
            ),
          ],
          bottom: TabBar(
            // labelColor: kPrimeColor,
            indicatorColor: kDarkLightColor,
            tabs: _kTabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TabBarView(
            children: _kTabPages,
          ),
        ),
      ),
    );
  }
}
