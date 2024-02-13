import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static Color lightPrimaryColor=Color(0xffB7935F);
  static Color darkPrimaryColor=Color(0xff141A2E);
  static Color black=Color(0xff242424);
  static Color gold=Color(0xffFACC1D);
  static Color white=Colors.white;
  static ThemeData lightTheme= ThemeData(
    primaryColor: lightPrimaryColor,
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
      backgroundColor: lightPrimaryColor,
      selectedItemColor: black,
      unselectedIconTheme: IconThemeData(color: white),
      unselectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: IconThemeData(
      color: lightPrimaryColor,
      size: 40
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 28,
        color: black,
      ),
      headlineLarge: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 30,
        color: black,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 25,
        color: black,
      ),
      headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: black,
      ),
      titleMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: black,
      ),
    ),
  );


  static ThemeData darkTheme= ThemeData(
    primaryColor: darkPrimaryColor,
    appBarTheme: AppBarTheme(
      foregroundColor: white,
          backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.elMessiri(
          fontWeight: FontWeight.w600,
          fontSize: 30,
          color:white,
        ),
      ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkPrimaryColor,
      selectedItemColor: gold,
      unselectedIconTheme: IconThemeData(color: white),
      unselectedLabelStyle: TextStyle(color: Colors.transparent,fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: IconThemeData(
      color: white,
      size: 40
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 28,
        color: white,
      ),
      headlineLarge: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 30,
        color: white,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 25,
        color: white,
      ),
      headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: gold,
      ),
      titleMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: white,
      ),
    ),
  );
}