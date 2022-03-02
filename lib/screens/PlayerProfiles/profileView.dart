import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/Controlller/product_controller.dart';
import 'package:football_app/screens/PlayerProfiles/profileDetail.dart';
import 'package:get/get.dart';

import 'package:football_app/Controlller/addFavController.dart';
import 'package:football_app/Model/profile.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/main.dart';

class Profiles extends StatelessWidget {
  List<ProfileDetailData> profilesData = ProfileDetailData.Details;
  final controller = Get.put(ProfileController());
  var isFavourite = false;
  final cartController = Get.put(FavController());
  @override
  Widget build(
    BuildContext context,
  ) {
    final List<Widget> profileDetailData = ProfileDetailData.Details.map(
      (item) => GestureDetector(
        onTap: () => Get.to(
          ProfileDetail(
            profileDetailData: item,
          ),
        ),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
              color: kPrimeColor, borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                bottom: 180,
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(item.image!,
                        fit: BoxFit.cover, width: kWidth)),
              ),
              Positioned(
                top: 240,
                left: 5,
                right: 5,
                bottom: 10,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white24),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              item.name!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kLightColor,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.age!,
                              style: TextStyle(
                                fontSize: 18,
                                color: kLightColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              item.flag!,
                              height: 16,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 22,
                              color: kLightColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.pos!,
                              style: TextStyle(
                                fontSize: 13,
                                color: kLightColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.web,
                              size: 22,
                              color: kLightColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.country!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: kLightColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Sport: ",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: kLightColor),
                            ),
                            Text(
                              item.league!,
                              style: const TextStyle(
                                  fontSize: 13, color: kLightColor),
                            ),
                            const Icon(
                              Icons.sports_football_outlined,
                              color: Colors.redAccent,
                              size: 22,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 130,
                child: GetBuilder<FavController>(
                    init: FavController(),
                    builder: (cont) {
                      return Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPrimeColor),
                        child: IconButton(
                          icon: Icon(
                            isFavourite == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: kLightColor,
                          ),
                          onPressed: () {
                            cartController.addItem(
                              item.id!,
                              item.image!,
                              item.name!,
                              item.image!,
                              item.flag!,
                              item.pos!,
                              item.country!,
                              item.sportName!,
                            );
                          },
                        ),
                      );
                    }),
              ),
              // child: Container(
              //   height: 37,
              //   width: 37,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: kPrimeColor),
              //   child: const Icon(
              //     Icons.favorite_border_outlined,
              //     color: kLightColor,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ).toList();

    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: kDarkColor,
          ),
        ),
        backgroundColor: kLightColor,
        title: CupertinoSearchTextField(
          style: const TextStyle(color: kLightColor),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Athletes / Players",
                    style: TextStyle(
                        color: kPrimeColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: profileDetailData,
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                // onPageChanged: ,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
