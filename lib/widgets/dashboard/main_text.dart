import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainText extends StatelessWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Bem-vindo ao Mobile Game Tracker!",
      textScaler: TextScaler.linear(1.6),
      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}
