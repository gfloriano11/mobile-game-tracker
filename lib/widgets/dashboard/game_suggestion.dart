import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/models/game.dart';
import 'package:mobile_game_tracker/screens/game_details.dart';

class GameSuggestion extends StatelessWidget {
  final Game game;
  final VoidCallback onGameUpdated;

  const GameSuggestion({
    super.key,
    required this.game,
    required this.onGameUpdated,
  });

  Future<void> openGame(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameDetails(game: game)),
    );

    onGameUpdated();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(179, 241, 241, 241),
      ),
      child: GestureDetector(
        onTap: () => openGame(context),
        child: Row(
          spacing: 10,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image(
                  image: AssetImage(game.images),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(game.name, style: const TextStyle(fontSize: 18)),

                  Text(game.genre, style: const TextStyle(fontSize: 14)),

                  const SizedBox(height: 4),

                  Container(
                    constraints: const BoxConstraints(maxWidth: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 221, 221, 221),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    child: Text(
                      game.platform,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
