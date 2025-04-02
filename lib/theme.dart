import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF161513),
  textTheme: GoogleFonts.jetBrainsMonoTextTheme().apply(
    bodyColor: Colors.white,  // Default text color
    displayColor: Colors.white, // Headings and display text
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF222222),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
