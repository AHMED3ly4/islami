import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:provider/provider.dart';

import '../setting_provider.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaNumber=0;
  String sebha='سبحان الله';
  void tasbehLogic(){
    if(sebhaNumber==33){
      sebhaNumber=0;
      if(sebha=='سبحان الله'){
        sebha = 'الحمدلله';
      }else if(sebha=='الحمدلله'){
        sebha ='الله اكبر';
      }else {
        sebha ='سبحان الله';
      }
    }else{
      sebhaNumber++;
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider =Provider.of<SettingProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
              child: Container(
                  child: Image.asset(
                      settingProvider.appMode == ThemeMode.dark? 'assets/images/sebha_dark.png':'assets/images/sebha_image.png'
                  ),
              ),
            onTap:tasbehLogic,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text(
              sebhaNumber.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: settingProvider.appMode == ThemeMode.dark? AppTheme.gold:Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text(
              sebha,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color:  settingProvider.appMode == ThemeMode.dark? AppTheme.black:AppTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
