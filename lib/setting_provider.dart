
import 'package:flutter/material.dart';

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
}