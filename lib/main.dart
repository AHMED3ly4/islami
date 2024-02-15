import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/screens/hadeeth_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/sura_screen.dart';
import 'package:islami/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    settingProvider.getThemeFromSF();
    settingProvider.getLanguageFromSF();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingProvider.appMode,
      routes: {
        HomeScreen.routeName : (context)=>HomeScreen(),
        SuraScreen.routeName : (context)=>SuraScreen(),
        HadeethScreen.routeName : (context)=>HadeethScreen(),
      },
     initialRoute: HomeScreen.routeName,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
      locale: Locale(settingProvider.language),
    );
  }
}

