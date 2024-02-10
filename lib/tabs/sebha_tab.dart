import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

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
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
              child: Container(
                  child: Image.asset('assets/images/sebha_image.png'),
              ),
            onTap:tasbehLogic,
          ),
          Text(
            'عدد التسبيحات',
            style: AppTheme.lightTheme.textTheme.titleMedium,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text(
              sebhaNumber.toString(),
              style: AppTheme.lightTheme.textTheme.bodyLarge,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Text(
              sebha,
              style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                color: AppTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
