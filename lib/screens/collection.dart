import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/models/game.dart';
import 'package:mobile_game_tracker/widgets/dashboard/main_text.dart';
import 'package:mobile_game_tracker/widgets/shared/game_card.dart';

class Collection extends StatelessWidget {
  final List<Game> games;

  const Collection({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                MainText(text: "Biblioteca"),

                const SizedBox(height: 20),

                Column(
                  spacing: 20,
                  children: games.map((game) => GameCard(game: game)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
