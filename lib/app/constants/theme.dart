import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/constants/color.dart';

ThemeData themeSimanang = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: colorSmanel,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: colorSmanel,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.shifting,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);
