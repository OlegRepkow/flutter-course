import 'package:flutter_lab/features/top_news/data/data_source/models/top_news_dto.dart';

abstract interface class NewsApiBase {
  Future<TopNewsDto> getTopNews();
}
