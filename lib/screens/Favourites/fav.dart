import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:football_app/Controlller/addFavController.dart';
import 'package:football_app/Model/profile.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/screens/PlayerProfiles/profileDetail.dart';

class Favourites extends StatelessWidget {
  var favController = Get.put(FavController());

  // List<ProfileDetailData> profileDetailData = ProfileDetailData.Details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimeColor,
        title: const Center(
          child: Text(
            "Favorites",
            style: TextStyle(color: kLightColor),
          ),
        ),
      ),
      body: GetBuilder<FavController>(
        init: FavController(),
        builder: (cont) => Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: favController.items.length,
                  itemBuilder: (context, index) => favController.items.isEmpty
                      ? FavCard(
                          // favController.items.values.toList()[index].id,
                          favController.items.values.toList()[index].image,
                          favController.items.values.toList()[index].name,
                          favController.items.values.toList()[index].age,
                          favController.items.values.toList()[index].flag,
                          favController.items.values.toList()[index].pos,
                          favController.items.values.toList()[index].country,
                          favController.items.values.toList()[index].sportname,
                        )
                      : Center(
                          child: Container(
                          child: Text('no data'),
                        ))),
            ),
          ],
        ),
      ),
      // body: ListView.builder(
      //   // shrinkWrap: true,
      //   itemCount: profileDetailData.length,
      //   itemBuilder: (context, index) {
      //     return Dismissible(
      //       key: UniqueKey(),
      //       direction: DismissDirection.horizontal,
      //       background: Container(
      //         color: kPrimeColor,
      //       ),
      //       onDismissed: (DismissDirection direction) {
      //         print(direction);
      //         String action = direction == DismissDirection.startToEnd
      //             ? "Can't be delete"
      //             : "Deleted";

      //         print(action);
      //         var item = profileDetailData.removeAt(index);

      //         setState(() {});
      //         Scaffold.of(context).hideCurrentSnackBar();
      //         Scaffold.of(context).showSnackBar(
      //           SnackBar(
      //             backgroundColor: kLightColor,
      //             behavior: SnackBarBehavior.floating,
      //             content: Text("Item $action",
      //                 style: TextStyle(
      //                   color: kPrimeColor,
      //                 )),
      //             action: SnackBarAction(
      //                 label: "Undo",
      //                 textColor: kPrimeColor,
      //                 onPressed: () {
      //                   profileDetailData.insert(index, item);
      //                   setState(() {});
      //                 }),
      //           ),
      //         );
      //       },
      //       child: GestureDetector(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (_) => ProfileDetail(
      //                 profileDetailData: profileDetailData[index],
      //               ),
      //             ),
      //           );
      //         },
      //         child: FavCard(
      //           profileDetailData: profileDetailData[index],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

class FavCard extends StatelessWidget {
  String? image, name, age, flag, pos, country, sportname;
  FavCard(
    String images,
    String names,
    String ages,
    String flags,
    String poss,
    String countrys,
    String sportnames, {
    Key? key,
    this.sportname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: 110,
          width: _w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  // blurRadius: 4,
                  spreadRadius: 1,
                  offset: const ui.Offset(0, 3)),
            ],
            gradient: const LinearGradient(
                colors: [kLightColor, Colors.white12],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Image.asset(
                      image!,
                      fit: BoxFit.contain,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            age!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            flag!,
                            height: 15,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        pos!,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 11,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Country: ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            country!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Sport:",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            sportname!,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          const Icon(
                            Icons.sports_football_outlined,
                            color: Colors.redAccent,
                            size: 17,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
