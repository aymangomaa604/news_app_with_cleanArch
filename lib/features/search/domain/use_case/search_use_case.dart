import 'package:dartz/dartz.dart';
import 'package:news_app_with_cleanarch/core/utils/errors/failure.dart';
import 'package:news_app_with_cleanarch/features/search/domain/entity/search_news_entity.dart';
import 'package:news_app_with_cleanarch/features/search/domain/repos/search_repo.dart';

abstract class UseCase<type, param> {
  Future<Either<Failure, type>> fetchSearchNews([param param]);
}

class SearchNewsUseCase extends UseCase<List<SearchNewsEntity>, String> {
  final SearchRepo searchRepo;

  SearchNewsUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<SearchNewsEntity>>> fetchSearchNews(
      [String? param]) {
    return searchRepo.fetchSearchNews(category: param!);
  }
}
