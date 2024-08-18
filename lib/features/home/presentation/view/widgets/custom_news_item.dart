import 'package:flutter/material.dart';
import 'package:news_app_with_cleanarch/core/utils/styles.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';

class CustomNewsItem extends StatelessWidget {
  const CustomNewsItem({super.key, required this.newsEntity});
  final NewsEntity newsEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Image.network(newsEntity.image,
              fit: BoxFit.fill, height: 200, width: double.infinity),
           Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            newsEntity.tiTle,
            style: Styles.textStyle30,
          ),
           Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            newsEntity.subTitle,
            style: Styles.textStyle20,
          ),
        ],
      ),
    );
  }
}
