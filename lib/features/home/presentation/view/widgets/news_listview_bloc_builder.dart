import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/NewsListView.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view_model/cubit/all_news_cubit.dart';

class NewsListViewBlocBuilder extends StatelessWidget {
  const NewsListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNewsCubit, AllNewsState>(
      builder: (context, state) {
        if (state is AllNewsSuccess) {
          return NewsListView(news:state.news);
        } else if (state is AllNewsFailure) {
          return Center(child: Text(state.errMesage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
