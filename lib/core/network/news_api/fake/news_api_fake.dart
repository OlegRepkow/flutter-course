import 'package:flutter_lab/core/network/news_api/news_api_base.dart';
import 'package:flutter_lab/features/top_news/data/data_source/models/article_dto.dart';
import 'package:flutter_lab/features/top_news/data/data_source/models/top_news_dto.dart';

class NewsApiFake implements NewsApiBase {
  @override
  Future<TopNewsDto> getTopNews() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return TopNewsDto(
      status: 'ok',
      totalResults: 1,
      articles: [
        ArticleDto(
          title: "It's just a fake news",
          description: "But it's a good fake news",
          url: 'https://www.google.com',
          urlToImage:
              'https://ichef.bbci.co.uk/news/480/cpsprodpb/13643/production/_99372497_whatsubject.jpg.webp',
          publishedAt: '2021-01-01T00:00:00Z',
          content: 'Then you want to be a good fake news',
          author: 'Fake Author',
        ),
      ],
    );
  }
}
