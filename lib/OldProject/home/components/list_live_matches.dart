import 'package:flutter/material.dart';
import 'package:football_app/OldProject/home/components/card_live_match.dart';
import 'package:football_app/OldProject/home/components/no_live_matches.dart';
import 'package:football_app/OldProject/live_match_details.dart';
import 'package:football_app/OldProject/models/match.dart';
import 'package:football_app/Utils/constants.dart';

class LiveMatchesList extends StatelessWidget {
  final Function? onTap;
  final Function? onViewAllTap;
  final List<SoccerMatch>? liveMatches;
  const LiveMatchesList(
      {Key? key, this.liveMatches, this.onTap, this.onViewAllTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: marginLarge,
          ),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Live Matches",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSizeLarge,
                  ),
                ),
              ),
              Visibility(
                // visible: liveMatches != null,
                visible: onViewAllTap != null,
                child: InkWell(
                  onTap: () => onViewAllTap,
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: fontSizeStandard,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: liveMatches != null && liveMatches!.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: liveMatches?.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => LiveMatchDetails(
                            match: liveMatches![index],
                          ),
                        ),
                      ),
                      child: LiveMatchCard(
                        index: index,
                        match: liveMatches![index],
                      ),
                    );
                  },
                )
              : const NoLiveMatches(),
        ),
      ],
    );
  }
}
