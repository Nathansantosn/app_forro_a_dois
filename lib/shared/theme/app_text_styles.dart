import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle title({Color color = Colors.black, double fontSize = 20}) {
    return GoogleFonts.leagueSpartan(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      letterSpacing: -1.0,
      height: 0.8,
    );
  }

  static TextStyle subtitle({
    Color color = Colors.black87,
    double fontSize = 16,
  }) {
    return GoogleFonts.leagueSpartan(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle body({Color color = Colors.black54, double fontSize = 14}) {
    return GoogleFonts.leagueSpartan(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }
}
