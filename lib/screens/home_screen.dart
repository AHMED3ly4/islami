import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeeth_tab.dart';
import 'package:islami/tabs/quran_tab.dart';
import 'package:islami/tabs/radio_tab.dart';
import 'package:islami/tabs/sebha_tab.dart';
import 'package:islami/tabs/setting_tab.dart';
import 'package:provider/provider.dart';

import '../setting_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName ='home screen name';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List<Widget> tabs=[
  QuranTab(),
  HadeethTab(),
  SebhaTab(),
  RadioTab(),
  SettingTab(),
];
int selectedTab=0;
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider =Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
            settingProvider.appMode == ThemeMode.dark? 'assets/images/bg_dark.png':'assets/images/bg3.png'
        ),
            fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text('إسلامي',
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon:  ImageIcon(AssetImage('assets/images/moshaf_icon.png')),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon:  ImageIcon(AssetImage('assets/images/hadeeth.png')),
                label: 'Hadeeth',
              ),
              BottomNavigationBarItem(
                icon:  ImageIcon(AssetImage('assets/images/sebha.png')),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon:  ImageIcon(AssetImage('assets/images/radio_blue.png')),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon:  Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
          currentIndex: selectedTab,
          onTap: (index){
              selectedTab =index;
              setState(() {
              });
          },
        ),
        body: tabs[selectedTab],
      ),
    );
  }
}
