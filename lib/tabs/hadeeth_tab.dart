import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/screens/hadeeth_screen.dart';
import 'package:provider/provider.dart';

import '../setting_provider.dart';

class HadeethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider =Provider.of<SettingProvider>(context);
    Color bounrdiesColor =settingProvider.appMode == ThemeMode.light ? Theme.of(context).primaryColor : AppTheme.gold;
    return Column(
      children: [
        Image.asset('assets/images/hadeth_image.png'),
        Container(
          height: 4,
          width: double.infinity,
          color: bounrdiesColor,
        ),
        Text(
          'الأحاديث',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Container(
          height: 4,
          width: double.infinity,
          color: bounrdiesColor,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              child: Text(
                '${index + 1} الحديث رقم',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              onTap: (){
                Navigator.pushNamed(context, HadeethScreen.routeName,
                arguments: index
                );
              },
            ),
            itemCount: 50,
          ),
        ),
      ],
    );
  }
}
