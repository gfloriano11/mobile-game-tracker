import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_game_tracker/screens/collection.dart';
import 'package:mobile_game_tracker/screens/dashboard.dart';
import 'package:mobile_game_tracker/screens/game_details.dart';
import 'package:mobile_game_tracker/screens/status.dart';

// import 'package:mobile_game_tracker/screens/status.dart';

GoRouter createAppRouter(List<dynamic> games) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: _getSelectedIndex(state.uri.path),
              onDestinationSelected: (index) {
                switch (index) {
                  case 0:
                    context.go('/');
                  case 1:
                    context.go('/games');
                  case 2:
                    context.go('/status');
                }
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.library_books_outlined),
                  selectedIcon: Icon(Icons.library_books),
                  label: 'Biblioteca',
                ),
                NavigationDestination(
                  icon: Icon(Icons.bar_chart_outlined),
                  selectedIcon: Icon(Icons.bar_chart),
                  label: 'Status',
                ),
              ],
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => Dashboard(games: games),
          ),
          GoRoute(
            path: '/games',
            builder: (context, state) => Collection(games: games),
          ),
          GoRoute(
            path: '/status',
            builder: (context, state) => Status(games: games),
          ),
          GoRoute(
            path: '/games/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return GameDetails(id: id, games: games);
            },
          ),
          // GoRoute(path: '/status', builder: (context, state) => const Status()),
        ],
      ),
    ],
  );
}

int _getSelectedIndex(String path) {
  switch (path) {
    case '/games':
      return 1;
    case '/status':
      return 2;
    case '/':
    default:
      return 0;
  }
}
