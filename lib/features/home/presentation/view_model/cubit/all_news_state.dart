part of 'all_news_cubit.dart';

@immutable
sealed class AllNewsState {}

final class AllNewsInitial extends AllNewsState {}

final class AllNewsLoading extends AllNewsState {}

final class AllNewsFailure extends AllNewsState {
  final String errMesage;

  AllNewsFailure({required this.errMesage});
}

final class AllNewsSuccess extends AllNewsState {
  final List<NewsEntity> news;

  AllNewsSuccess({required this.news});
}
