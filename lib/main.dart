import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/screens/hadeeth_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/sura_screen.dart';
import 'package:islami/setting_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (c)=>SettingProvider(),
      child: IslamiApp(),
  ),
  );
}

class IslamiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<SettingProvider>(context).appMode,
      routes: {
        HomeScreen.routeName : (context)=>HomeScreen(),
        SuraScreen.routeName : (context)=>SuraScreen(),
        HadeethScreen.routeName : (context)=>HadeethScreen(),
      },
     initialRoute: HomeScreen.routeName,
    );
  }
}

