import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/app/app_router.dart';
import 'package:mobile_game_tracker/app/json_loader.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  List<dynamic> games = [];

  @override
  void initState() {
    super.initState();
    loadGames().then((data) => setState(() => games = data));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: createAppRouter(games),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xFFF1F1F1),
          indicatorColor: const Color(0xFFE0E0E0),

          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
