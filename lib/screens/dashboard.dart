import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/app/json_loader.dart';
import 'package:mobile_game_tracker/widgets/dashboard/info.dart';
import 'package:mobile_game_tracker/widgets/dashboard/main_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  List<dynamic> games = [];

  @override
  void initState() {
    super.initState();
    loadGames().then((data) => setState(() => games = data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainText(),
            if (games.isNotEmpty)
              Column(
                children: games.map((g) => Info(text: g["name"])).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
