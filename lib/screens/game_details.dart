import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/app/json_loader.dart';

class GameDetails extends StatefulWidget {
  final String id;
  const GameDetails({super.key, required this.id});

  @override
  State<GameDetails> createState() => _GameDetails();
}

class _GameDetails extends State<GameDetails> {
  dynamic game = {};

  int hoursPlayed = 0;
  int review = 0;

  @override
  void initState() {
    super.initState();

    loadGames().then((data) {
      final foundGame = data
          .where((g) => g["id"].toString() == widget.id.toString())
          .first;

      setState(() {
        game = foundGame;
        hoursPlayed = int.tryParse(foundGame["hoursPlayed"].toString()) ?? 0;
        review =
            int.tryParse(
              foundGame["review"].toString().replaceAll("/10", ""),
            ) ??
            0;
      });
    });
  }

  void increaseHours() {
    setState(() => hoursPlayed++);
  }

  void decreaseHours() {
    if (hoursPlayed <= 0) return;
    setState(() => hoursPlayed--);
  }

  void increaseReview() {
    if (review >= 10) return;
    setState(() => review++);
  }

  void decreaseReview() {
    if (review <= 0) return;
    setState(() => review--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16),
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
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
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
                        _buildCounterCard(
                          title: "HORAS JOGADAS",
                          subtitle: "Mínimo 0h",
                          value: "${hoursPlayed}h",
                          onDecrease: decreaseHours,
                          onIncrease: increaseHours,
                        ),

                        const SizedBox(height: 16),

                        // =========================
                        // AVALIAÇÃO
                        // =========================
                        _buildCounterCard(
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

Widget _buildCounterCard({
  required String title,
  required String subtitle,
  required String value,
  required VoidCallback onDecrease,
  required VoidCallback onIncrease,
  Color? valueColor,
}) {
  return Container(
    width: double.infinity,

    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

    decoration: BoxDecoration(
      color: const Color.fromARGB(179, 241, 241, 241),
      borderRadius: BorderRadius.circular(22),
    ),

    child: Column(
      children: [
        // TÍTULO
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                letterSpacing: 0.5,
                color: Color.fromARGB(255, 115, 130, 165),
              ),
            ),

            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 145, 155, 180),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // CONTROLES
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            _buildControlButton(
              icon: Icons.remove,
              onPressed: onDecrease,
              isDecrease: true,
            ),

            Text(
              value,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: valueColor ?? const Color.fromARGB(255, 25, 43, 82),
              ),
            ),

            _buildControlButton(icon: Icons.add, onPressed: onIncrease),
          ],
        ),
      ],
    ),
  );
}

Widget _buildControlButton({
  required IconData icon,
  required VoidCallback onPressed,
  bool isDecrease = false,
}) {
  return SizedBox(
    width: 48,
    height: 48,

    child: Material(
      color: isDecrease
          ? const Color.fromARGB(255, 213, 222, 242)
          : const Color.fromARGB(255, 54, 119, 240),

      borderRadius: BorderRadius.circular(30),

      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,

        child: Icon(
          icon,
          color: isDecrease
              ? const Color.fromARGB(255, 90, 108, 145)
              : Colors.white,
        ),
      ),
    ),
  );
}
