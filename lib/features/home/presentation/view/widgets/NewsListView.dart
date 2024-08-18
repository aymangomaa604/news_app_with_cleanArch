import 'package:flutter/material.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/custom_news_item.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, Index) {
          return CustomNewsItem();
        });
  }
}