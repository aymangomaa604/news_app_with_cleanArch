import 'package:hive/hive.dart';
part 'search_news_entity.g.dart';
@HiveType(typeId: 1)
class SearchNewsEntity extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String tiTle;
  @HiveField(2)
  final String subTitle;
  @HiveField(3)
  final String uRl;

  SearchNewsEntity(
      {required this.image,
      required this.tiTle,
      required this.subTitle,
      required this.uRl});
}
