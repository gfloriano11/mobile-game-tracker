
import 'package:flutter/material.dart';
import 'package:mobile_game_tracker/widgets/game_details.dart/control_button.dart';

class CountInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final Color? valueColor;

  const CountInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onIncrease,
    required this.onDecrease,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(179, 241, 241, 241),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          // TÍTULO
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.5,
                    color: Color.fromARGB(255, 115, 130, 165),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  subtitle,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(255, 145, 155, 180),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // CONTROLES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ControlButton(
                icon: Icons.remove,
                onPressed: onDecrease,
                isDecrease: true,
              ),

              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                ),
              ),

              ControlButton(
                icon: Icons.add,
                onPressed: onIncrease,
                isDecrease: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
