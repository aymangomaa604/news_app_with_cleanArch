import 'package:hive/hive.dart';
part 'news_entity.g.dart';
@HiveType(typeId: 0)
class NewsEntity extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String tiTle;
  @HiveField(2)
  final String subTitle;
  @HiveField(3)
  final String uRl;

  NewsEntity(
      {required this.image,
      required this.tiTle,
      required this.subTitle,
      required this.uRl});
}


/*

flutter packages pub run build_runner build
*/