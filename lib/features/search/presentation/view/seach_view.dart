import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_cleanarch/core/utils/api_services.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:news_app_with_cleanarch/features/search/data/models/repos/Search_repo_imp.dart';
import 'package:news_app_with_cleanarch/features/search/data/remote_data_source/searc_Local_data_source.dart';
import 'package:news_app_with_cleanarch/features/search/data/remote_data_source/search_remote_data_source.dart';
import 'package:news_app_with_cleanarch/features/search/domain/use_case/search_use_case.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:news_app_with_cleanarch/features/search/presentation/view_model/cubit/search_news_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchNewsCubit(
        SearchNewsUseCase(
          SearchRepoImp(
            searchLocalDataSource: SearchLocalDataSourceImp(),
            searchRemoteDataSource: SearchRemoteDataSourceImp(
              ApiServices(),
            ),
          ),
        ),
      ),
      child:  Scaffold(
        body: SafeArea(child: SearchViewBody()),
      ),
    );
  }
}
