import 'package:flutter_lab/features/top_news/data/data_source/models/source_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_dto.g.dart';

@JsonSerializable()
class ArticleDto {
  ArticleDto({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) {
    return _$ArticleDtoFromJson(json);
  }

  SourceDto? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
}
