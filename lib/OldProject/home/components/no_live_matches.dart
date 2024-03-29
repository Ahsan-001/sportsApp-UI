import 'package:flutter/material.dart';
import 'package:football_app/Utils/constants.dart';

class NoLiveMatches extends StatelessWidget {
  final double? height;
  const NoLiveMatches({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(marginLarge),
      margin: const EdgeInsets.symmetric(
        horizontal: marginxLarge,
        vertical: marginStandard,
      ),
      decoration: const BoxDecoration(
        color: Color(0x5565FFED),
        borderRadius: BorderRadius.all(
          Radius.circular(radiusStandard),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/schedule.png"),
          const Text("No Live Matches right now !"),
        ],
      ),
    );
  }
}
