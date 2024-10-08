import 'package:news_app_with_cleanarch/features/home/domain/entity/news_entity.dart';

import 'source.dart';

class NewsModel extends NewsEntity {
	Source? source;
	dynamic author;
	String? title;
	String? description;
	String? url;
	String? urlToImage;
	String? publishedAt;
	String? content;

	NewsModel({
		this.source, 
		this.author, 
		this.title, 
		this.description, 
		this.url, 
		this.urlToImage, 
		this.publishedAt, 
		this.content, 
	}) : super(image: urlToImage ?? '', tiTle: title ?? '', subTitle: description ?? '', uRl: url ?? '');

	factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
				source: json['source'] == null
						? null
						: Source.fromJson(json['source'] as Map<String, dynamic>),
				author: json['author'] as dynamic,
				title: json['title'] as String?,
				description: json['description'] as String?,
				url: json['url'] as String?,
				urlToImage: json['urlToImage'] as String?,
				publishedAt: json['publishedAt'] as String?,
				content: json['content'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'source': source?.toJson(),
				'author': author,
				'title': title,
				'description': description,
				'url': url,
				'urlToImage': urlToImage,
				'publishedAt': publishedAt,
				'content': content,
			};
}
