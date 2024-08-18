import 'package:hive/hive.dart';
import 'package:news_app_with_cleanarch/core/utils/api_services.dart';
import 'package:news_app_with_cleanarch/core/utils/consts.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';
import 'package:news_app_with_cleanarch/features/search/data/models/search_news_model/search_news_model.dart';
import 'package:news_app_with_cleanarch/features/search/domain/entity/search_news_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchNewsEntity>> fetChSearchNews({required String category});
}

class SearchRemoteDataSourceImp extends SearchRemoteDataSource {
  final ApiServices apiServices;

  SearchRemoteDataSourceImp(this.apiServices);

  @override
  Future<List<SearchNewsEntity>> fetChSearchNews({ String? category }) async {
    var data = await apiServices.get(
        url:
            'https://newsapi.org/v2/everything?q=$category&apiKey=3565d7441a8b4a9b9b00e647c55b5ad0');
    List<SearchNewsEntity> news = [];
    for (var element in data['articles']) {
      news.add(SearchNewsModel.fromJson(element));
    }
     var box = Hive.box<SearchNewsEntity>(kSearchNews);
    box.addAll(news);
    return news;
  }
}
