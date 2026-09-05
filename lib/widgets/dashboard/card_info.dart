import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String mainText;
  final String subtitle;

  const CardInfo({super.key, required this.mainText, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            mainText,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text(subtitle, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
