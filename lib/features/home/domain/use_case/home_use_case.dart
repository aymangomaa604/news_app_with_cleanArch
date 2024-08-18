import 'package:dartz/dartz.dart';
import 'package:news_app_with_cleanarch/core/utils/errors/failure.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';
import 'package:news_app_with_cleanarch/features/home/domain/repo/home_repo.dart';

abstract class UseCase<type, param> {
  Future<Either<Failure, type>> fetchAllNews();
}

class FetchAllNewsUseCase extends UseCase<List<NewsEntity>, int> {
  final HomeRepo homeRepo;

  FetchAllNewsUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchAllNews() async {

    //permission
    return await homeRepo.fetchAllNews();
  }
}
