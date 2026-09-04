import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadWords() async {
  final jsonString = await rootBundle.loadString('assets/games.json');
  return jsonDecode(jsonString);
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
