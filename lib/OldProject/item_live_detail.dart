import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_app/Utils/constants.dart';

class LiveDetailItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String subTitle2;
  const LiveDetailItem(
      {Key? key,
      required this.image,
      required this.title,
      this.subTitle = "",
      this.subTitle2 = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: marginStandard, horizontal: marginLarge),
      padding: const EdgeInsets.symmetric(
          vertical: marginStandard, horizontal: marginLarge),
      decoration: const BoxDecoration(
        color: Color(0x555075F0),
        borderRadius: BorderRadius.all(
          Radius.circular(radiusStandard),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: SvgPicture.asset(image),
          ),
          const SizedBox(width: marginLarge),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: marginStandard),
              Text(
                subTitle,
                style: const TextStyle(color: Colors.black45),
              ),
              Visibility(
                visible: subTitle2.isNotEmpty,
                child: Container(
                  margin: const EdgeInsets.only(top: marginStandard),
                  child: Text(
                    subTitle2,
                    style: const TextStyle(color: Colors.black45),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
