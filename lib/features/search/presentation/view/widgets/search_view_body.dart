import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/custom_news_item.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view/widgets/custom_text_field.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view/widgets/search_news_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SearchNewsListView(),
        )),
      ],
    );
  }
}
