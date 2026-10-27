import 'package:flutter_lab/features/top_news/data/data_source/models/article_dto.dart';

class ArticleEntity {
  ArticleEntity({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleEntity.fromDto(ArticleDto dto) {
    return ArticleEntity(
      title: dto.title ?? '',
      description: dto.description ?? '',
      url: dto.url ?? '',
      urlToImage: dto.urlToImage ?? '',
      publishedAt: dto.publishedAt ?? '',
      content: dto.content ?? '',
    );
  }

  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
}
