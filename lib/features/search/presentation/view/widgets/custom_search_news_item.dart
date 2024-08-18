import 'package:flutter/material.dart';
import 'package:news_app_with_cleanarch/core/utils/styles.dart';
import 'package:news_app_with_cleanarch/features/search/domain/entity/search_news_entity.dart';

class CustomSearchNewsItem extends StatelessWidget {
  const CustomSearchNewsItem({super.key, required this.searchNewsEntity});
  final SearchNewsEntity searchNewsEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Image.network(searchNewsEntity.image,
              fit: BoxFit.fill, height: 200, width: double.infinity),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            searchNewsEntity.tiTle,
            style: Styles.textStyle30,
          ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            searchNewsEntity.subTitle,
            style: Styles.textStyle20,
          ),
        ],
      ),
    );
  }
}
