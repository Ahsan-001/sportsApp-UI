import 'package:flutter/material.dart';
import 'package:football_app/OldProject/api/soccer_api.dart';
import 'package:football_app/OldProject/item_team_info.dart';
import 'package:football_app/OldProject/models/league.dart';
import 'package:football_app/OldProject/models/team_info.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/OldProject/background.dart';

class LeagueTeams extends StatefulWidget {
  static const ROUTE_NAME = "LeagueTeams";
  final League? league;
  const LeagueTeams({Key? key, this.league}) : super(key: key);

  @override
  _LeagueTeamsState createState() => _LeagueTeamsState();
}

class _LeagueTeamsState extends State<LeagueTeams> {
  int season = 2020;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _topPadding = MediaQuery.of(context).padding.top;
    print("League Id:: ${widget.league!.id}");
    return Scaffold(
      body: Stack(
        children: [
          //background
          const TransparentBackground(),
          //main column contains top header and list
          Column(
            children: [
              //top header container
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(radiusStandard),
                  bottomRight: Radius.circular(radiusStandard),
                ),
                child: SizedBox(
                  height: _size.height * 0.27,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          widget.league!.cover,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      ),
                      Positioned(
                        top: _topPadding,
                        left: marginLarge,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(marginStandard),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Season:"),
                    DropdownButton<int>(
                      hint: Text(season.toString()),
                      // dropdownColor:,
                      items: SEASONS.map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          season = val!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: SoccerApi.getLeagueTeams(widget.league!.id, season),
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("An Error occurred !"),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("No Teams for the current league !"),
                      );
                    }

                    final List<TeamInfo>? teams =
                        snapshot.data as List<TeamInfo>?;
                    return ListView.builder(
                      itemCount: teams!.length,
                      itemBuilder: (ctx, index) {
                        return TeamInfoItem(
                          // leagueId: widget.league.id,
                          teamInfo: teams[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
