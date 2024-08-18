import 'package:flutter/material.dart';
import 'package:news_app_with_cleanarch/core/utils/styles.dart';

class CustomNewsItem extends StatelessWidget {
  const CustomNewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Image.asset('assets/news2.jpg',
              fit: BoxFit.fill, height: 200, width: double.infinity),
          const Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            'Ayman Gomaa is good programmer in flutter develpment',
            style: Styles.textStyle30,
          ),
          const Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            'Ayman Gomaa is good programmer in flutter develpment',
            style: Styles.textStyle20,
          ),
        ],
      ),
    );
  }
}
