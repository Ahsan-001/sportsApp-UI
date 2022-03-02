import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/screens/Favourites/fav.dart';

import 'package:football_app/screens/HomeView/mainhome.dart';
import 'package:football_app/Model/profile.dart';
import 'package:football_app/screens/PlayerProfiles/profileView.dart';
import 'package:football_app/screens/UserProfile/edit_profile.dart';

class NavBar extends StatefulWidget {
  List<ProfileDetailData> profileDetailData = ProfileDetailData.Details;
  NavBar({Key? key}) : super(key: key);

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  var currentIndex = 0;

  static List<Widget> _widgetOption = <Widget>[
    HomeScreen(),
    Favourites(),
    EditProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightColor,
      body: Center(
        child: _widgetOption.elementAt(currentIndex),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(_width * .05),
        height: _width * .156,
        width: _width,
        decoration: BoxDecoration(
          color: kPrimeColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: _width * .10),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex ? _width * .32 : _width * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? _width * .12 : 0,
                    width: index == currentIndex ? _width * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.black12
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex ? _width * .31 : _width * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? _width * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex ? listOfTitles[index] : '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? _width * .03 : 20,
                          ),
                          Icon(listOfIcons[index],
                              size: _width * .076,
                              color: index == currentIndex
                                  ? Colors.white
                                  : Colors.white24),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home,
    Icons.favorite_border,
    Icons.person,
  ];

  List<String> listOfTitles = [
    'Home',
    'Favourite',
    'Profile',
  ];
}
