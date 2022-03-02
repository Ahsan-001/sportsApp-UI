import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/OldProject/models/team.dart';
import 'package:football_app/Utils/constants.dart';

class TeamLogoName extends StatelessWidget {
  final Team team;
  final double width;
  final bool isHome;
  const TeamLogoName(
      {Key? key, required this.team, required this.width, required this.isHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isHome ? "Home" : "Away",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: marginLarge),
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: team.logoUrl,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: marginLarge),
          Text(
            team.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: fontSizeStandard),
          ),
        ],
      ),
    );
  }
}
