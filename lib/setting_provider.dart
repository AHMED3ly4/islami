
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier{
  ThemeMode appMode = ThemeMode.light;
  String language = 'en';
  void changeAppMode(ThemeMode newTheme){
    appMode =newTheme;
    notifyListeners();
  }
  void changeLanguage(String newLanguage){
    language =newLanguage;
    notifyListeners();
  }
  Future<void> getThemeFromSF() async {
    SharedPreferences themePrefs = await SharedPreferences.getInstance();
    String? stringValue =  themePrefs.getString('theme');
    ThemeMode? storedTheme;
    if(stringValue=='dark'){
      storedTheme =ThemeMode.dark;
    }else if(stringValue=='light'){
      storedTheme =ThemeMode.light;
    }
    if(storedTheme != appMode && storedTheme != null){
      changeAppMode(storedTheme);
    }
  }
  Future<void> getLanguageFromSF() async {
    SharedPreferences languagePrefs = await SharedPreferences.getInstance();
    String? storedLanguage =  languagePrefs.getString('language');

    if(storedLanguage != language && storedLanguage != null){
      changeLanguage(storedLanguage);
    }
  }
}