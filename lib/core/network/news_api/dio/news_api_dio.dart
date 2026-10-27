import 'package:dio/dio.dart';
import 'package:flutter_lab/core/network/news_api/news_api_base.dart';
import 'package:flutter_lab/features/top_news/data/data_source/models/top_news_dto.dart';

class NewsApiDio implements NewsApiBase {
  NewsApiDio();

  final Dio dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org'));

  static const String _apiKey = String.fromEnvironment('API_KEY');

  @override
  Future<TopNewsDto> getTopNews() async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v2/everything',
      queryParameters: {
        'q': 'Ukraine',
        'sortBy': 'popularity',
        'apiKey': _apiKey,
      },
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Failed to load top news, ${response.statusCode}');
    }

    return TopNewsDto.fromJson(data);
  }
}
