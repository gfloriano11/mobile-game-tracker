import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/models/game.dart';
import 'package:mobile_game_tracker/widgets/status/hours_chart.dart';
import 'package:mobile_game_tracker/widgets/status/status_card.dart';

class Status extends StatelessWidget {
  final List<Game> games;

  const Status({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    int totalHours = 0;
    double reviews = 0;

    for (final game in games) {
      totalHours += game.hoursPlayed;
      reviews += game.review;
    }

    final averageReview = games.isEmpty ? 0.0 : reviews / games.length;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Estatísticas",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 25, 43, 82),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: StatusCard(
                      title: "HORAS JOGADAS",
                      value: "${totalHours}h",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: StatusCard(
                      title: "MÉDIA DAS NOTAS",
                      value: averageReview.toStringAsFixed(1),
                      valueColor: const Color.fromARGB(255, 255, 80, 120),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                "Horas por jogo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 25, 43, 82),
                ),
              ),

              const SizedBox(height: 14),

              Container(
                width: double.infinity,
                height: 400,
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 246, 250),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: HoursChart(games: games),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
