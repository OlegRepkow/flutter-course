import 'package:flutter_lab/features/top_news/data/data_source/models/article_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_news_dto.g.dart';

@JsonSerializable()
class TopNewsDto {
  TopNewsDto({this.status, this.totalResults, this.articles});

  factory TopNewsDto.fromJson(Map<String, dynamic> json) {
    return _$TopNewsDtoFromJson(json);
  }

  String? status;
  int? totalResults;
  List<ArticleDto>? articles;

  Map<String, dynamic> toJson() => _$TopNewsDtoToJson(this);
}
