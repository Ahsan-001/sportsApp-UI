import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class GoalStat extends StatelessWidget {
  final int home;
  final int away;
  final int elapsed;

  const GoalStat({Key? key, this.home = 0, this.away = 0, this.elapsed = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$elapsed'",
            style: const TextStyle(
              fontSize: fontSizeLarge,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "$home - $away",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: fontSizexLarge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
