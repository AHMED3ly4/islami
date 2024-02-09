import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/screens/hadeeth_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/sura_screen.dart';

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
        SuraScreen.routeName : (context)=>SuraScreen(),
        HadeethScreen.routeName : (context)=>HadeethScreen(),
      },
     initialRoute: HomeScreen.routeName,
    );
  }
}

