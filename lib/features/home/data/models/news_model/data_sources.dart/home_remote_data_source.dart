import 'package:hive_flutter/adapters.dart';
import 'package:news_app_with_cleanarch/core/utils/api_services.dart';
import 'package:news_app_with_cleanarch/core/utils/consts.dart';
import 'package:news_app_with_cleanarch/features/home/data/models/news_model/news_model.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<NewsEntity>> fetchAllNews();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<NewsEntity>> fetchAllNews() async {
    var data = await apiServices.get(
        url:
            'https://newsapi.org/v2/everything?q=general&apiKey=3565d7441a8b4a9b9b00e647c55b5ad0');

    List<NewsEntity> news = [];
    for (var element in data['articles']) {
      news.add(NewsModel.fromJson(element));
    }
    var box = Hive.box<NewsEntity>(kAllNews);
    box.addAll(news);
    return news;
  }
}
