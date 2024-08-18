import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app_with_cleanarch/core/utils/errors/failure.dart';
import 'package:news_app_with_cleanarch/features/search/data/remote_data_source/searc_Local_data_source.dart';
import 'package:news_app_with_cleanarch/features/search/data/remote_data_source/search_remote_data_source.dart';
import 'package:news_app_with_cleanarch/features/search/domain/entity/search_news_entity.dart';
import 'package:news_app_with_cleanarch/features/search/domain/repos/search_repo.dart';

class SearchRepoImp extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchRepoImp(
      {required this.searchRemoteDataSource,
      required this.searchLocalDataSource});
  @override
  Future<Either<Failure, List<SearchNewsEntity>>> fetchSearchNews(
      {required String category }) async {
    List<SearchNewsEntity> news;

    try {
      news = await searchRemoteDataSource.fetChSearchNews(category: category);

      if (news.isNotEmpty) {
        return right(news);
      } else {
        news = searchLocalDataSource.fetchSearchNews();
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
