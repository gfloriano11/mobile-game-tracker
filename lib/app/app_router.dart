import 'package:go_router/go_router.dart';
import 'package:mobile_game_tracker/screens/collection.dart';
import 'package:mobile_game_tracker/screens/dashboard.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Dashboard()),
    GoRoute(path: '/games', builder: (context, state) => const Collection()),
  ],
);
