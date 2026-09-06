import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isDecrease;

  const ControlButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isDecrease = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,

      child: Material(
        color: isDecrease
            ? const Color.fromARGB(255, 213, 222, 242)
            : const Color.fromARGB(255, 54, 119, 240),

        borderRadius: BorderRadius.circular(30),

        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onPressed,

          child: Icon(
            icon,
            color: isDecrease
                ? const Color.fromARGB(255, 90, 108, 145)
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
