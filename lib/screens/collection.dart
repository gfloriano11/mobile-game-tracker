import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/app/json_loader.dart';
import 'package:mobile_game_tracker/widgets/dashboard/main_text.dart';
import 'package:mobile_game_tracker/widgets/shared/game_card.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _Collection();
}

class _Collection extends State<Collection> {
  List<dynamic> games = [];

  @override
  void initState() {
    super.initState();
    loadGames().then((data) => setState(() => games = data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16),
          child: SizedBox(
            width: 350,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MainText(text: "Biblioteca"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Column(
                      spacing: 20,
                      children: games.map((g) => GameCard(game: g)).toList(),
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
