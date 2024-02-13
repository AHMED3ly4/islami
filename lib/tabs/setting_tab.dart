import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
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
              Text('Dark Mode',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 30,
              ),
              ),
              Switch(
                  value: settingProvider.appMode == ThemeMode.dark,
                  onChanged: (isDark){
                    isDark?
                    settingProvider.changeAppMode(ThemeMode.dark):settingProvider.changeAppMode(ThemeMode.light);
                  },
                thumbColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
                activeTrackColor: AppTheme.gold,
                inactiveTrackColor: AppTheme.lightPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
