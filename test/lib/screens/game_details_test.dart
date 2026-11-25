import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_game_tracker/models/game.dart';
import 'package:mobile_game_tracker/screens/game_details.dart';

void main() {
    testWidgets('review maximum should be 20', (tester) async {
        final game = Game(
            id: 1,
            name: 'Test Game',
            genre: 'RPG',
            platform: 'PC',
            description: 'Test description',
            images: 'assets/games/rdr2.jpg',
            hoursPlayed: 0,
            review: 19,
        );

        tester.view.physicalSize = const Size(1200, 2000);
        tester.view.devicePixelRatio = 1;

        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
            MaterialApp(home: GameDetails(game: game)),
        );

        // 19 -> 20
        await tester.tap(find.byIcon(Icons.add).last);
        await tester.pump();

        expect(game.review, 20);
        expect(find.text('20/20'), findsOneWidget);

        // 20 -> 20 (não pode ultrapassar)
        await tester.tap(find.byIcon(Icons.add).last);
        await tester.pump();

        expect(game.review, 20);
        expect(find.text('20/20'), findsOneWidget);
    });
}