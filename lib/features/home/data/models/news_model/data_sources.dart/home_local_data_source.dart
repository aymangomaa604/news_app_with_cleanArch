import 'package:hive_flutter/adapters.dart';
import 'package:news_app_with_cleanarch/core/utils/consts.dart';
import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';

abstract class HomeLocalDataSource {
  List<NewsEntity> fetchAllNews();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
List<NewsEntity> fetchAllNews() {
    var box = Hive.box<NewsEntity>(kAllNews);
    return  box.values.toList();
  }
}
