import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';
import 'package:news_app_with_cleanarch/features/home/domain/use_case/home_use_case.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit(this.fetchAllNewsUseCase) : super(AllNewsInitial());
  final FetchAllNewsUseCase fetchAllNewsUseCase;

  Future<void> getAllNews() async {
    emit(AllNewsLoading());
    var result = await fetchAllNewsUseCase.fetchAllNews();
    result.fold((error) {
      emit(AllNewsFailure(errMesage: error.errMessage));
    }, (news) {
      emit(AllNewsSuccess(news: news));
    });
  }
}
