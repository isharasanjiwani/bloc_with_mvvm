import 'dart:io';

import 'package:block_practice/core/constants/constants.dart';
import 'package:block_practice/core/resources/data_state.dart';
import 'package:block_practice/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:block_practice/features/daily_news/domain/entities/article.dart';
import 'package:block_practice/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

import '../models/article.dart';

class ArticleRepositoryImpl extends ArticleRepository {

  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
          apiKey: newsApiKey,
          country: countryQuery,
          category: categoryQuery
      );

      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}