import 'package:dartz/dartz.dart';
import 'package:news_app_with_cleanarch/core/utils/errors/failure.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';

abstract class HomeRepo {
  Future <Either <Failure, List<NewsEntity>>> fetchAllNews();
}
