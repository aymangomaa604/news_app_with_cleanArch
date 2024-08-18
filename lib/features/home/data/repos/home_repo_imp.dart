import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app_with_cleanarch/core/utils/errors/failure.dart';
import 'package:news_app_with_cleanarch/features/home/data/models/news_model/data_sources.dart/home_local_data_source.dart';
import 'package:news_app_with_cleanarch/features/home/data/models/news_model/data_sources.dart/home_remote_data_source.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';
import 'package:news_app_with_cleanarch/features/home/domain/repo/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImp(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<NewsEntity>>> fetchAllNews() async {
    List<NewsEntity> news;
    try {
      news = await homeRemoteDataSource.fetchAllNews();
      if (news.isNotEmpty) {
        return right(news);
      } else {
        news = homeLocalDataSource.fetchAllNews();
        return right(news);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
