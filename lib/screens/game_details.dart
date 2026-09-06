import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/models/game.dart';
import 'package:mobile_game_tracker/widgets/game_details.dart/count_info_card.dart';

class GameDetails extends StatefulWidget {
  final Game game;

  const GameDetails({super.key, required this.game});

  @override
  State<GameDetails> createState() => _GameDetails();
}

class _GameDetails extends State<GameDetails> {
  int hoursPlayed = 0;
  int review = 0;

  @override
  void initState() {
    super.initState();

    hoursPlayed = widget.game.hoursPlayed;
    review = widget.game.review;
  }

  void increaseHours() {
    setState(() {
      hoursPlayed++;
      widget.game.hoursPlayed = hoursPlayed;
    });
  }

  void decreaseHours() {
    if (hoursPlayed <= 0) return;

    setState(() {
      hoursPlayed--;
      widget.game.hoursPlayed = hoursPlayed;
    });
  }

  void increaseReview() {
    if (review >= 10) return;

    setState(() {
      review++;
      widget.game.review = review;
    });
  }

  void decreaseReview() {
    if (review <= 0) return;

    setState(() {
      review--;
      widget.game.review = review;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Detalhes"),
      ),
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
                              widget.game.images,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),

                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(179, 241, 241, 241),
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
                                      widget.game.name,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 25, 43, 82),
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
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
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            widget.game.genre,
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

                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                              255,
                                              235,
                                              235,
                                              235,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            widget.game.platform,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                80,
                                                80,
                                                80,
                                              ),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 16),

                                    Text(
                                      widget.game.description,
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

                        CountInfoCard(
                          title: "HORAS JOGADAS",
                          subtitle: "Mínimo 0h",
                          value: "${hoursPlayed}h",
                          onDecrease: decreaseHours,
                          onIncrease: increaseHours,
                        ),

                        const SizedBox(height: 16),

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
