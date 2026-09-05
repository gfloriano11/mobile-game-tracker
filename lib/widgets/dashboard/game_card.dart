import 'package:flutter/material.dart';

class GameCard extends StatefulWidget {
  final dynamic game;
  const GameCard({super.key, required this.game});

  @override
  State<GameCard> createState() => _Info();
}

class _Info extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(179, 241, 241, 241),
      ),
      child: Row(
        spacing: 10,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Image(
              image: AssetImage(widget.game["images"]),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.game["name"], style: TextStyle(fontSize: 18)),
                Text(widget.game["genre"], style: TextStyle(fontSize: 14)),
                Row(
                  spacing: 6,
                  children: [
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 221, 221, 221),
                          ),
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 2,
                            bottom: 2,
                          ),

                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 150),
                            child: Text(
                              widget.game["platform"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(widget.game["hoursPlayed"] + "h"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
