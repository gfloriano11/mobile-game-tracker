import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/widgets/dashboard/main_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainText(),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
