import 'package:flutter/material.dart';
import 'package:football_app/OldProject/api/soccer_api.dart';
import 'package:football_app/OldProject/models/match.dart';
import 'package:football_app/OldProject/models/statistic.dart';
import 'package:football_app/OldProject/statistics/components/row.dart';
import 'package:football_app/OldProject/statistics/components/team.dart';
import 'package:football_app/Utils/constants.dart';
import 'package:football_app/screens/background.dart';

class MatchStatistics extends StatefulWidget {
  final SoccerMatch match;
  const MatchStatistics({Key? key, required this.match}) : super(key: key);

  @override
  _MatchStatisticsState createState() => _MatchStatisticsState();
}

class _MatchStatisticsState extends State<MatchStatistics> {
  late List<Statistic> homeStatistics;
  late List<Statistic> awayStatistics;
  var _isLoading = false;
  var _homeStatLength = 0;
  var _awayStatLength = 0;
  @override
  void initState() {
    super.initState();
    getStatistics();
  }

  void getStatistics() async {
    isLoading = true;
    homeStatistics = await SoccerApi.getTeamStatistics(
        widget.match.fixture.id, widget.match.home.id);

    awayStatistics = await SoccerApi.getTeamStatistics(
        widget.match.fixture.id, widget.match.away.id);
    isLoading = false;
    _homeStatLength = homeStatistics.length;
    _awayStatLength = awayStatistics.length;
    // print("Home:: homestats :: ${homeStatistics.statistics.toList()}");
    // print("Home:: awaystats :: ${awayStatistics.statistics.toList()}");
  }

  set isLoading(bool loading) {
    setState(() {
      _isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _statLength =
        _homeStatLength >= _awayStatLength ? _awayStatLength : _homeStatLength;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_PRIMARY,
        title: const Text("Fixture Statistics"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          TransparentBackground(),
          Column(
            children: [
              //top header
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(radiusStandard),
                  bottomRight: Radius.circular(radiusStandard),
                ),
                child: Container(
                  padding: const EdgeInsets.all(marginLarge),
                  // height: _size.height * 0.2,
                  width: double.infinity,
                  color: COLOR_PRIMARY,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          widget.match.fixture.date.substring(0, 10),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TeamLogoName(
                            isHome: true,
                            width: _size.width * 0.25,
                            team: widget.match.home,
                          ),
                          SizedBox(
                            width: _size.width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.match.goal.home.toString(),
                                  style: const TextStyle(
                                      fontSize: fontSizexxLarge,
                                      color: Colors.white),
                                ),
                                const Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: fontSizexxLarge,
                                      color: Colors.white),
                                ),
                                Text(
                                  widget.match.goal.away.toString(),
                                  style: const TextStyle(
                                      fontSize: fontSizexxLarge,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          TeamLogoName(
                            isHome: false,
                            width: _size.width * 0.25,
                            team: widget.match.away,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //statistics list
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _statLength,
                        itemBuilder: (ctx, index) {
                          return StatisticRow(
                            // home: 2,
                            // away: 3,
                            // title: "tiot",
                            home: homeStatistics[index].value,
                            away: awayStatistics[index].value,
                            title: homeStatistics[index].type,
                          );
                        },
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
