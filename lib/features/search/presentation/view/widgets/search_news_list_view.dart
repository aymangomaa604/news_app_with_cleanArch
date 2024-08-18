import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/custom_news_item.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view/widgets/custom_search_news_item.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view_model/cubit/search_news_cubit.dart';

class SearchNewsListView extends StatelessWidget {
  const SearchNewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchNewsCubit, SearchNewsState>(
      builder: (context, state) {
        if (state is SearchNewsSuccess) {
          return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, Index) {
                return CustomSearchNewsItem(
                  searchNewsEntity: state.news[Index],
                );
              });
        } else if (state is SearchNewsFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is SearchNewsInitial) {
          return Center(child: Text('Search About News'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
