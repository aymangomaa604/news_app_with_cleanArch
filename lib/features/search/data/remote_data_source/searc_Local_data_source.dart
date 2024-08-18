import 'package:hive/hive.dart';
import 'package:news_app_with_cleanarch/core/utils/consts.dart';
import 'package:news_app_with_cleanarch/features/search/domain/entity/search_news_entity.dart';

abstract class SearchLocalDataSource {
  List<SearchNewsEntity> fetchSearchNews();
}

class SearchLocalDataSourceImp extends SearchLocalDataSource {
  @override
List<SearchNewsEntity> fetchSearchNews() {
    var box = Hive.box<SearchNewsEntity>(kSearchNews);
    return  box.values.toList();
  }
}
