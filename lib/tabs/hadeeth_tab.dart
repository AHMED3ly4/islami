import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/screens/hadeeth_screen.dart';

class HadeethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/hadeth_image.png'),
        Container(
          height: 4,
          width: double.infinity,
          color: AppTheme.primaryColor,
        ),
        Text(
          'الأحاديث',
          style: AppTheme.lightTheme.textTheme.headlineSmall,
        ),
        Container(
          height: 4,
          width: double.infinity,
          color: AppTheme.primaryColor,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              child: Text(
                '${index + 1} الحديث رقم',
                style: AppTheme.lightTheme.textTheme.bodyLarge,
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
