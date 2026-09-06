import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/app/json_loader.dart';
import 'package:mobile_game_tracker/screens/collection.dart';
import 'package:mobile_game_tracker/screens/dashboard.dart';
import 'package:mobile_game_tracker/screens/status.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<dynamic> games = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    loadGames().then((data) => setState(() => games = data));
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      Dashboard(games: games),
      Collection(games: games),
      Status(games: games),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,

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

      home: Scaffold(
        body: pages[currentIndex],

        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },

          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Início',
            ),
            NavigationDestination(
              icon: Icon(Icons.sports_esports_outlined),
              selectedIcon: Icon(Icons.sports_esports),
              label: 'Jogos',
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart_outlined),
              selectedIcon: Icon(Icons.bar_chart),
              label: 'Status',
            ),
          ],
        ),
      ),
    );
  }
}
