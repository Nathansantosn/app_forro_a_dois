import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Applogo extends StatelessWidget {
  const Applogo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'FORRÓ\nA',
            style: GoogleFonts.leagueSpartan(
              color: Color(0xFF000000),
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
              letterSpacing: -1.5,
              height: 0.9,
            ),
          ),
          TextSpan(
            text: ' DOIS',
            style: GoogleFonts.leagueSpartan(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1.5,
              height: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
