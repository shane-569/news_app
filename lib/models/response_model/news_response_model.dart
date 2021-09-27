import 'article.dart';

class NewsResponseModel {
  String? status;
  List<Article>? articles;

  NewsResponseModel({this.status, this.articles});

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      NewsResponseModel(
        status: json['status'] as String?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };
}
