import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleBlock extends StatelessWidget {
  const TitleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome TO',
          style: GoogleFonts.bebasNeue(
            textStyle: const TextStyle(fontSize: 45),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Gaadhi Hel.',
          style: GoogleFonts.pompiere(
            textStyle: const TextStyle(fontSize: 50),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

