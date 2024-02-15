import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/language.dart';
class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
  ];

  Future<void> addThemeToSp(String themeName)async{
    SharedPreferences themePrefs = await SharedPreferences.getInstance();
    await themePrefs.setString('theme', themeName) ;
  }
  Future<void> addLanguageToSp(String languageCode)async{
    SharedPreferences languagePrefs = await SharedPreferences.getInstance();
    await languagePrefs.setString('language', languageCode) ;
  }
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider =Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.darkMode,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 30,
              ),
              ),
              Switch(
                  value: settingProvider.appMode == ThemeMode.dark,
                  onChanged: (isDark){
                    if(isDark){
                      settingProvider.changeAppMode(ThemeMode.dark);
                      addThemeToSp('dark');
                    }else{
                      settingProvider.changeAppMode(ThemeMode.light);
                      addThemeToSp('light');
                    }
                  },
                thumbColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
                activeTrackColor: AppTheme.gold,
                inactiveTrackColor: AppTheme.lightPrimaryColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 30,
              ),
              ),
              DropdownButton(
                dropdownColor: settingProvider.appMode ==ThemeMode.dark ?Theme.of(context).primaryColor:null,
                value: settingProvider.language,
                  items: languages.map((language) => DropdownMenuItem(
                      child: Text(
                        language.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    value: language.code,
                  ),
                  ).toList(),
                  onChanged: (selectedLanguage){
                    if(selectedLanguage == settingProvider.language) return;
                    settingProvider.changeLanguage(selectedLanguage!);
                    addLanguageToSp(selectedLanguage);
                  },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
