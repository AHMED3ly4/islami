import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/screens/home_screen.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routeName : (context)=>HomeScreen(),
      },
     initialRoute: HomeScreen.routeName,
    );
  }
}

