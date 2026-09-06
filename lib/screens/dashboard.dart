import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/widgets/dashboard/dashboard_info.dart';
import 'package:mobile_game_tracker/widgets/dashboard/main_text.dart';
import 'package:mobile_game_tracker/widgets/shared/game_card.dart';

class Dashboard extends StatelessWidget {
  final List<dynamic> games;

  const Dashboard({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    int hoursPlayed = 0;
    double reviews = 0;

    for (final game in games) {
      hoursPlayed += int.tryParse(game["hoursPlayed"].toString()) ?? 0;
      reviews +=
          double.tryParse(game["review"].toString().replaceAll("/10", "")) ?? 0;
    }

    final gameCount = games.length;

    final averageReview = games.isEmpty ? 0.0 : (reviews / games.length);

    final platforms = games
        .map((game) => game["platform"])
        .where((platform) => platform != null)
        .toSet()
        .length;

    final recentPlayed = games.take(3).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                MainText(text: "Mobile Game Tracker"),

                const SizedBox(height: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    DashboardInfo(
                      gameCount: gameCount,
                      hoursPlayed: hoursPlayed,
                      platforms: platforms,
                      scoreAverage:
                          double.tryParse(averageReview.toStringAsFixed(1)) ??
                          0,
                    ),

                    if (recentPlayed.isNotEmpty)
                      const Text(
                        "Jogados recentemente",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    Column(
                      spacing: 20,
                      children: recentPlayed
                          .map((game) => GameCard(game: game))
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
