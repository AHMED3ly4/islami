import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/widget/sura.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../setting_provider.dart';

class SuraScreen extends StatefulWidget {
  static const routeName = 'sura screen name';
  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String>suraAyat=[];
  Future<void> getAyat (index)async{
    String sura = await rootBundle.loadString('assets/quran/$index.txt');
    suraAyat = sura.trim().split('\n');
    // int counter=1;
    // for(int i=1 ; i<=suraAyat.length;i+=2){
    //   suraAyat.insert(i, ('($counter)'));
    //   counter++;
    // } //1,3,5..
    for(int i=0 ;i<suraAyat.length;i++){
      suraAyat[i]+=('(${i+1})');
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider =Provider.of<SettingProvider>(context);
    Sura sura =ModalRoute.of(context)!.settings.arguments as Sura;
    suraAyat.isEmpty? getAyat(sura.fileIndex): null;
    bool isDark =settingProvider.appMode ==ThemeMode.dark;
     return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(
            isDark ? 'assets/images/bg_dark.png':'assets/images/bg3.png'
        ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            AppLocalizations.of(context)!.islami,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isDark ? Theme.of(context).primaryColor:AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سورة ${sura.name}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDark ? AppTheme.gold:null,
                  ),
                  ),
                  const SizedBox(width: 15,),
                  Icon(Icons.play_circle,color: isDark ? AppTheme.gold:AppTheme.black,)
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 2,
                width: MediaQuery.of(context).size.width *0.6,
                color:  isDark ? AppTheme.gold: Theme.of(context).primaryColor,
              ),
              suraAyat.isEmpty?const CircularProgressIndicator(): Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index)=> Text(
                      suraAyat[index],
                    style: Theme.of(context).textTheme.headlineMedium,
                    textDirection: TextDirection.rtl,
                  ),
                  itemCount: suraAyat.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
