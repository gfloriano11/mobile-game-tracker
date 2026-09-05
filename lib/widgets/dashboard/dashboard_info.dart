import 'package:flutter/material.dart';

import 'card_info.dart';

class DashboardInfo extends StatelessWidget {
  final int hoursPlayed;
  final int gameCount;
  final double scoreAverage;
  final int platforms;

  const DashboardInfo({
    super.key,
    required this.hoursPlayed,
    required this.gameCount,
    required this.scoreAverage,
    required this.platforms,
  });

  @override
  Widget build(BuildContext context) {
    final infos = [
      {"mainText": gameCount.toString(), "subtitle": "JOGOS"},
      {"mainText": scoreAverage.toString(), "subtitle": "MÉDIA"},
      {"mainText": platforms.toString(), "subtitle": "PLATAFORMAS"},
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(179, 241, 241, 241),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "HORAS JOGADAS",
                style: TextStyle(color: Color.fromARGB(255, 99, 99, 99)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    hoursPlayed.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const Text(" h no total"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: infos.map((info) {
                  return CardInfo(
                    mainText: info["mainText"]!,
                    subtitle: info["subtitle"]!,
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
