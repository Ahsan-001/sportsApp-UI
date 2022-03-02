import 'package:flutter/material.dart';
import 'package:football_app/OldProject/api/soccer_api.dart';
import 'package:football_app/OldProject/home/components/home_bottom.dart';
import 'package:football_app/OldProject/home/components/home_top.dart';
import 'package:football_app/OldProject/home/components/list_live_matches.dart';
import 'package:football_app/OldProject/league_fixtures.dart';
import 'package:football_app/OldProject/league_teams.dart';
import 'package:football_app/OldProject/models/match.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/OldProject/background.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimeColor,
      body: SafeArea(
        child: Stack(
          children: [
            const TransparentBackground(),
            Column(
              children: [
                const SizedBox(
                  //app bar
                  height: 50,
                  child: Center(
                    child: Text(
                      "Soccer App",
                      style: TextStyle(
                        color: COLOR_PRIMARY,
                        fontSize: fontSizexLarge,
                      ),
                    ),
                  ),
                ),
                HomeTop(
                  onViewAllTap: () {},
                  onLeagueTap: (league) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => LeagueFixtures(
                          league: league,
                        ),
                      ),
                    );
                  },
                  height: _size.height * 0.22,
                ),
                const SizedBox(
                  height: marginLarge,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: SoccerApi.getLiveMatches(),
                    // future: null,
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

                      final List<SoccerMatch> liveMatches =
                          snapshot.data as List<SoccerMatch>;
                      return LiveMatchesList(
                        liveMatches: liveMatches,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: marginLarge,
                ),
                HomeBottom(
                  onViewAllTap: null,
                  onLeagueTap: (league) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => LeagueTeams(league: league),
                      ),
                    );
                  },
                  height: _size.height * 0.22,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
