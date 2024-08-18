import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_with_cleanarch/features/search/domain/entity/search_news_entity.dart';
import 'package:news_app_with_cleanarch/features/search/domain/use_case/search_use_case.dart';

part 'search_news_state.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit(this.searchNewsUseCase) : super(SearchNewsInitial());
  final SearchNewsUseCase searchNewsUseCase;
  Future<void> getSearchNews({required String category }) async {
    emit(SearchNewsLoading());
    var result = await searchNewsUseCase.fetchSearchNews(category);
    result.fold((message) {
      emit(SearchNewsFailure(errMessage: message.errMessage));
    }, (news) {
      emit(SearchNewsSuccess(news: news));
    });
  }
}
