import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/models/game.dart';
import 'package:mobile_game_tracker/widgets/dashboard/dashboard_info.dart';
import 'package:mobile_game_tracker/widgets/dashboard/game_suggestion.dart';
import 'package:mobile_game_tracker/widgets/shared/main_text.dart';
import 'package:mobile_game_tracker/widgets/shared/game_card.dart';

class Dashboard extends StatefulWidget {
  final List<Game> games;
  final VoidCallback onGameUpdated;

  const Dashboard({
    super.key,
    required this.games,
    required this.onGameUpdated,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Game? suggestedGame;

  void suggestGame() {
    if (widget.games.isEmpty) return;

    final random = Random();

    setState(() {
      suggestedGame = widget.games[random.nextInt(widget.games.length)];
    });
  }

  @override
  void initState() {
    super.initState();
    debugPrint("Dashboard criada");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Dashboard BUILD");
    int hoursPlayed = 0;
    double reviews = 0;

    for (final game in widget.games) {
      hoursPlayed += game.hoursPlayed;
      reviews += game.review;
    }

    final gameCount = widget.games.length;

    final averageReview = widget.games.isEmpty
        ? 0.0
        : reviews / widget.games.length;

    final platforms = widget.games.map((game) => game.platform).toSet().length;

    final recentPlayed = widget.games.take(3).toList();

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

                    // Botão "O que jogar?"
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            235,
                            235,
                            235,
                          ),
                          foregroundColor: Colors.black87,
                          elevation: 0,
                        ),
                        onPressed: suggestGame,
                        child: const Text("O que jogar?"),
                      ),
                    ),

                    // Sugestão
                    if (suggestedGame != null)
                      GameSuggestion(game: suggestedGame!),

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
                          .map(
                            (game) => GameCard(
                              game: game,
                              onGameUpdated: widget.onGameUpdated,
                            ),
                          )
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
