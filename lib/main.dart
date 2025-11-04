import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_shell.dart';

void main() {
  runApp(const GaadhiHelApp());
}

class GaadhiHelApp extends StatelessWidget {
  const GaadhiHelApp({super.key});

  static const Color primaryColor = Color(0xFF8B1E7C);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaadhi Hel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const HomeShell(),
      debugShowCheckedModeBanner: false,
    );
  }
}
