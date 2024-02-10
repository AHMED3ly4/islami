import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/widget/sura.dart';

class SuraScreen extends StatefulWidget {
  static const routeName = 'sura screen name';
  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String>suraAyat=[];
  Future<void> getAyat (index)async{
    String sura = await rootBundle.loadString('assets/quran/$index.txt');
    sura=sura.trim();
    suraAyat = sura.split('\n');
    int counter=1;
    for(int i=1 ; i<=suraAyat.length;i+=2){
      suraAyat.insert(i, ('($counter)'));
      counter++;
    } //1,3,5..

    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    Sura sura =ModalRoute.of(context)!.settings.arguments as Sura;
    suraAyat.isEmpty? getAyat(sura.fileIndex): null;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/bg3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'إسلامي',
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppTheme.white,
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
                  style: AppTheme.lightTheme.textTheme.bodyLarge,
                  ),
                  SizedBox(width: 15,),
                  Icon(Icons.play_circle,color: AppTheme.black,)
                ],
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width *0.6,
                color:  AppTheme.primaryColor,
              ),
              suraAyat.isEmpty?const CircularProgressIndicator(): Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index)=> Text(
                      suraAyat[index],
                    style: const TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
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
