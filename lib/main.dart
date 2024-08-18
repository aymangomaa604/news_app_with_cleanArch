import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app_with_cleanarch/core/utils/api_services.dart';
import 'package:news_app_with_cleanarch/core/utils/app_routes.dart';
import 'package:news_app_with_cleanarch/core/utils/consts.dart';
import 'package:news_app_with_cleanarch/features/home/data/models/news_model/data_sources.dart/home_local_data_source.dart';
import 'package:news_app_with_cleanarch/features/home/data/models/news_model/data_sources.dart/home_remote_data_source.dart';
import 'package:news_app_with_cleanarch/features/home/data/repos/home_repo_imp.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';
import 'package:news_app_with_cleanarch/features/home/domain/use_case/home_use_case.dart';
import 'package:news_app_with_cleanarch/features/home/presentation/view_model/cubit/all_news_cubit.dart';

void main() async {
  await Hive.initFlutter();
   Hive.registerAdapter(NewsEntityAdapter());
  await Hive.openBox<NewsEntity>(kAllNews);
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllNewsCubit(
            FetchAllNewsUseCase(
              HomeRepoImp(
                homeLocalDataSource: HomeLocalDataSourceImp(),
                homeRemoteDataSource: HomeRemoteDataSourceImp(
                  ApiServices(),
                ),
              ),
            ),
          )..getAllNews(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}






/*
await Hive.initFlutter();
  await Hive.openBox(darkModeBox);

  */