import 'package:dio/dio.dart';
import 'package:flutter_lab/core/network/news_api/news_api_base.dart';
import 'package:flutter_lab/features/top_news/data/data_source/models/top_news_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_retrofit.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class NewsApiRetrofit implements NewsApiBase {
  factory NewsApiRetrofit(Dio dio, {String? baseUrl}) = _NewsApiRetrofit;

  @override
  @GET('/v2/everything')
  Future<TopNewsDto> getTopNews({
    @Query('q') String? q = 'Ukraine',
    @Query('sortBy') String? sortBy = 'popularity',
    @Query('apiKey') String? apiKey = const String.fromEnvironment('API_KEY'),
  });
}
