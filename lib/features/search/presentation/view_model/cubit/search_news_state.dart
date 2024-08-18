part of 'search_news_cubit.dart';

@immutable
sealed class SearchNewsState {}

final class SearchNewsInitial extends SearchNewsState {}

final class SearchNewsLoading extends SearchNewsState {}

final class SearchNewsSuccess extends SearchNewsState {
  final List<SearchNewsEntity> news;

  SearchNewsSuccess({required this.news});
}

final class SearchNewsFailure extends SearchNewsState {
  final String errMessage;

  SearchNewsFailure({required this.errMessage});
}
