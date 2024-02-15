import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class RadioTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/radio_image.png',
        ),
        Text(
            'إذاعة القران الكريم',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.skip_previous),
            Icon(Icons.play_arrow),
            Icon(Icons.skip_next),
          ],
        ),
      ],
    );
  }
}
