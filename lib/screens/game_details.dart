import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/widgets/game_details.dart/count_info_card.dart';

class GameDetails extends StatefulWidget {
  final String id;
  final List<dynamic> games;

  const GameDetails({super.key, required this.id, required this.games});

  @override
  State<GameDetails> createState() => _GameDetails();
}

class _GameDetails extends State<GameDetails> {
  late dynamic game;

  int hoursPlayed = 0;
  int review = 0;

  @override
  void initState() {
    super.initState();
    game = widget.games.firstWhere((g) => g["id"].toString() == widget.id);

    hoursPlayed = int.tryParse(game["hoursPlayed"].toString()) ?? 0;

    review = int.tryParse(game["review"].toString().replaceAll("/10", "")) ?? 0;
  }

  void increaseHours() {
    setState(() {
      hoursPlayed++;
      game["hoursPlayed"] = hoursPlayed;
    });
  }

  void decreaseHours() {
    if (hoursPlayed <= 0) return;

    setState(() {
      hoursPlayed--;
      game["hoursPlayed"] = hoursPlayed;
    });
  }

  void increaseReview() {
    if (review >= 10) return;

    setState(() {
      review++;
      game["review"] = review;
    });
  }

  void decreaseReview() {
    if (review <= 0) return;

    setState(() {
      review--;
      game["review"] = review;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              game["images"],
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),

                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(179, 241, 241, 241),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      game["name"],
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 25, 43, 82),
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          255,
                                          225,
                                          234,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        game["genre"],
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            255,
                                            85,
                                            125,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    Text(
                                      game["description"],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        height: 1.5,
                                        color: Color.fromARGB(
                                          255,
                                          105,
                                          116,
                                          140,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // =========================
                        // HORAS JOGADAS
                        // =========================
                        CountInfoCard(
                          title: "HORAS JOGADAS",
                          subtitle: "Mínimo 0h",
                          value: "${hoursPlayed}h",
                          onDecrease: decreaseHours,
                          onIncrease: increaseHours,
                        ),

                        const SizedBox(height: 16),

                        // =========================
                        // AVALIAÇÃO
                        // =====_buildCounterCard====================
                        CountInfoCard(
                          title: "AVALIAÇÃO ATUAL",
                          subtitle: "Intervalo 0 a 10",
                          value: "$review/10",
                          valueColor: const Color.fromARGB(255, 255, 80, 120),
                          onDecrease: decreaseReview,
                          onIncrease: increaseReview,
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
