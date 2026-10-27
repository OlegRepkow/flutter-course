import 'package:flutter_lab/core/network/news_api/news_api_base.dart';
import 'package:flutter_lab/features/top_news/data/data_source/models/article_dto.dart';

class TopNewsDataSource {
  TopNewsDataSource({required NewsApiBase newsApi}) : _newsApi = newsApi;

  final NewsApiBase _newsApi;

  Future<List<ArticleDto>> getTopNews() async {
    final topNewsDto = await _newsApi.getTopNews();
    return topNewsDto.articles ?? [];
  }
}
