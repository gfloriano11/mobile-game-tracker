import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameCard extends StatelessWidget {
  final dynamic game;

  const GameCard({super.key, required this.game});

  void openGame(BuildContext context, int id) {
    context.push('/games/$id');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openGame(context, game["id"]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(179, 241, 241, 241),
        ),
        child: Row(
          spacing: 10,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Image(
                image: AssetImage(game["images"]),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(game["name"], style: const TextStyle(fontSize: 18)),

                  Text(game["genre"], style: const TextStyle(fontSize: 14)),

                  Row(
                    spacing: 6,
                    children: [
                      Flexible(
                        child: Container(
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
                            game["platform"],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),

                      Text("${game["hoursPlayed"]}h"),
                    ],
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
