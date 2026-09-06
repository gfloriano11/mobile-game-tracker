import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/app/json_loader.dart';
import 'package:mobile_game_tracker/widgets/dashboard/dashboard_info.dart';
import 'package:mobile_game_tracker/widgets/dashboard/game_card.dart';
import 'package:mobile_game_tracker/widgets/dashboard/main_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  List<dynamic> games = [];
  List<dynamic> recentPlayed = [];
  int hoursPlayed = 0;
  int gameCount = 6;
  int differentPlatformsCount = 0;
  double averageReview = 6;

  @override
  void initState() {
    super.initState();
    loadGames().then(
      (data) => setState(() {
        games = data;
        recentPlayed = games
            .where(
              (g) => g["wasPlayedRecently"] != null && g["wasPlayedRecently"],
            )
            .toList();
      }),
    );
    loadData().then(
      (data) => setState(() {
        hoursPlayed = data["hoursPlayed"] ?? 0;
        gameCount = data["games"] ?? 0;
        differentPlatformsCount = data["platforms"] ?? 0;
        averageReview = data["averageReview"] ?? 0;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16),
          child: SizedBox(
            width: 350,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MainText(text: "Mobile Game Tracker"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    DashboardInfo(
                      gameCount: gameCount,
                      hoursPlayed: hoursPlayed,
                      platforms: differentPlatformsCount,
                      scoreAverage: averageReview,
                    ),
                    if (recentPlayed.isNotEmpty)
                      Text(
                        style: TextStyle(fontSize: 20),
                        "Jogados recentemente:",
                      ),
                    Column(
                      spacing: 20,
                      children: recentPlayed
                          .map((g) => GameCard(game: g))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
