import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<dynamic>> loadGames() async {
  final jsonString = await rootBundle.loadString('assets/games.json');
  final data = jsonDecode(jsonString);
  return data['games'];
}

Future<Map<String, dynamic>> loadData() async {
  final jsonString = await rootBundle.loadString('assets/games.json');
  final data = jsonDecode(jsonString);
  return data['dashboard'];
}
