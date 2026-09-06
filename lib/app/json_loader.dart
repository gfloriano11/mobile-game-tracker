import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobile_game_tracker/models/game.dart';

Future<List<Game>> loadGames() async {
  final jsonString = await rootBundle.loadString("assets/games.json");
  final data = jsonDecode(jsonString) as Map<String, dynamic>;
  return data["games"]
      .map((game) => Game.fromJson(game as Map<String, dynamic>))
      .toList()
      .cast<Game>();
}

Future<Map<String, dynamic>> loadData() async {
  final jsonString = await rootBundle.loadString('assets/games.json');
  final data = jsonDecode(jsonString);
  return data['dashboard'];
}
