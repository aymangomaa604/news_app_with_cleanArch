import 'package:flutter/material.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
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
           HashCachedImage(
            imageUrl: newsEntity.image,
            height: 200,
            width: double.infinity,
            placeholder: (context) =>
                Center(child: const CircularProgressIndicator()),
            errorWidget: (context, error, stackTrace) =>
                const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
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
