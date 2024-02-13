import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/widget/hadeeth.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../setting_provider.dart';

class HadeethScreen extends StatefulWidget {
  static const routeName='hadeeth name rout';
  @override
  State<HadeethScreen> createState() => _HadeethScreenState();
}

class _HadeethScreenState extends State<HadeethScreen> {
  Hadeeth? hadeeth;
  Future<void> getHadeeth(index) async{
    String ahadeeth = await rootBundle.loadString('assets/ahadeeth/ahadeeth.txt');

    List<String> totalaHadeeth=ahadeeth.split('#');
    List<String> ourHadeeth=totalaHadeeth[index].trim().split('\n');
    String hadeethNumber= ourHadeeth[0];
    ourHadeeth.removeAt(0);
    List<String> hadeethContent =ourHadeeth;
    hadeeth =Hadeeth(
      hadeethNumber: hadeethNumber,
      hadeethContent: hadeethContent,
    );
    setState(() {

    });
}
  @override
  Widget build(BuildContext context) {
    int arg =ModalRoute.of(context)!.settings.arguments as int;
    hadeeth == null ? getHadeeth(arg) : null;
    SettingProvider settingProvider =Provider.of<SettingProvider>(context);
    bool isDark =settingProvider.appMode ==ThemeMode.dark;
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(
          isDark? 'assets/images/bg_dark.png':'assets/images/bg3.png',
        ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'إسلامي',
          ),
        ),
        body: hadeeth==null? const CircularProgressIndicator():Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isDark ? Theme.of(context).primaryColor:AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${hadeeth!.hadeethNumber}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDark?AppTheme.gold:null,
                ),
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width *0.6,
                color:  isDark?AppTheme.gold:Theme.of(context).primaryColor,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index)=> Text(
                    hadeeth!.hadeethContent[index],
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  itemCount: hadeeth!.hadeethContent.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
