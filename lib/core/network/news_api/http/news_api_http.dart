import 'dart:convert';

import 'package:flutter_lab/core/network/news_api/news_api_base.dart';
import 'package:flutter_lab/features/top_news/data/data_source/models/top_news_dto.dart';
import 'package:http/http.dart' as http;

class NewsApiHttp implements NewsApiBase {
  NewsApiHttp();

  static const String _apiKey = String.fromEnvironment('API_KEY');

  static const String _baseUrl = 'https://newsapi.org/v2/everything';

  @override
  Future<TopNewsDto> getTopNews() async {
    final response = await http.get(
      Uri.parse(
        '$_baseUrl?q=Ukraine&sortBy=popularity&apiKey=$_apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final topNewsDto = TopNewsDto.fromJson(data);
      return topNewsDto;
    }

    throw Exception('Failed to load top news ${response.statusCode}');
  }
}
