import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/custom_news_item.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view/widgets/custom_text_field.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view/widgets/search_news_list_view.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view_model/cubit/search_news_cubit.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});
  String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          onSubmitted: (p0) {
            value = p0;
            BlocProvider.of<SearchNewsCubit>(context).getSearchNews(category: value!);
          },
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SearchNewsListView(),
        )),
      ],
    );
  }
}
