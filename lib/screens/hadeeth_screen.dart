import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/widget/hadeeth.dart';

import '../app_theme.dart';

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
        body: hadeeth==null? const CircularProgressIndicator():Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${hadeeth!.hadeethNumber}',
                style: AppTheme.lightTheme.textTheme.bodyLarge,
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width *0.6,
                color:  AppTheme.primaryColor,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index)=> Text(
                    hadeeth!.hadeethContent[index],
                    style: const TextStyle(fontSize: 22),
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
