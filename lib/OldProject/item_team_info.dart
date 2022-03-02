import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/OldProject/models/team_info.dart';
import 'package:football_app/Utils/constants.dart';

class TeamInfoItem extends StatelessWidget {
  final TeamInfo? teamInfo;
  const TeamInfoItem({Key? key, this.teamInfo}) : super(key: key);

  Widget _info(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _contWidth = _size.width - 4 * marginLarge;
    const _teamLogoHeight = 70.0;
    return Container(
      // color: Colors.blue,
      height: 270,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          vertical: marginStandard, horizontal: marginLarge),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(radiusStandard),
        ),
        child: Stack(
          children: [
            //card stack container
            Positioned(
              top: _teamLogoHeight - marginLarge,
              right: 0,
              left: 0,
              child: Stack(
                children: [
                  //stadium image container
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Image.network(
                      teamInfo!.venue.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  //black transparent container
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      color: const Color(0x88000000),
                    ),
                  ),
                  //content container
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: marginLarge,
                      vertical: marginStandard,
                    ),
                    child: Column(
                      children: [
                        //team name
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: marginStandard),
                          child: Text(
                            teamInfo!.team.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: fontSizeStandard,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        //team info
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: _contWidth * 0.5,
                              // width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _info(Icons.location_on_rounded,
                                      teamInfo!.team.name),
                                  _info(Icons.business_outlined,
                                      teamInfo!.team.country),
                                  _info(
                                      Icons.public,
                                      teamInfo!.team.isNational
                                          ? "National"
                                          : "Not National"),
                                ],
                              ),
                            ),
                            Container(
                              height: _contWidth * 0.5,
                              // width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _info(
                                    Icons.location_on_rounded,
                                    teamInfo!.venue.name,
                                  ),
                                  _info(
                                    Icons.location_on_rounded,
                                    teamInfo!.venue.address,
                                  ),
                                  _info(
                                    Icons.people,
                                    teamInfo!.venue.capacity.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //logo container
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                // color: Colors.yellow,
                // width: _contWidth * 0.2,
                height: _teamLogoHeight,
                alignment: Alignment.topCenter,
                child: CachedNetworkImage(
                  width: _contWidth * 0.2,
                  height: _teamLogoHeight,
                  fit: BoxFit.cover,
                  imageUrl: teamInfo!.team.logoUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
