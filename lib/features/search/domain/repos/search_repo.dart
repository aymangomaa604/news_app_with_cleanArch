import 'package:dartz/dartz.dart';
import 'package:news_app_with_cleanarch/core/utils/errors/failure.dart';
import 'package:news_app_with_cleanarch/features/search/domain/entity/search_news_entity.dart';

abstract class SearchRepo {
  Future <Either <Failure, List<SearchNewsEntity>>> fetchSearchNews({String category});
}
