import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static Color primaryColor=Color(0xffB7935F);
  static Color black=Color(0xff242424);
  static Color white=Colors.white;
  static ThemeData lightTheme= ThemeData(
    appBarTheme: AppBarTheme(
      foregroundColor: black,
          backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.elMessiri(
          fontWeight: FontWeight.w600,
          fontSize: 30,
          color: black
        ),
      ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: black,
      unselectedIconTheme: IconThemeData(color: white),
      unselectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 28
      ),
      headlineLarge: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 30,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 25,
      ),
      headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
    ),
  );
}