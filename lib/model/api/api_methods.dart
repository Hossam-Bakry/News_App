import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/api/news_response_model.dart';
import 'package:news_app/model/api/source_responce_model.dart';

class ApiMethods {
  static const String apiKey = 'a8f13463e12743adb9cea4d3a745673a';

  static Future<SourceResponce> loadNewsSourses(String category) async {
    Map<String, dynamic>? queryParams = {
      'apiKey': apiKey,
      'category': category,
    };

    Uri uri = Uri.https(
      'newsapi.org',
      '/v2/top-headlines/sources',
      queryParams,
    );

    var response = await http.get(uri);
    var sourceResponse = SourceResponce.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return sourceResponse;
    }

    if (sourceResponse.message != null) {
      throw Exception(sourceResponse.message);
    } else {
      throw Exception('error loading news source data');
    }
  }

  static Future<NewsResponse> loadNews({
    String? source,
    String? query,
  }) async {
    Map<String, dynamic>? queryParams = {
      'apiKey': apiKey,
      'sources': source,
      'qInTitle': query,
    };

    Uri uri = Uri.https(
      'newsapi.org',
      '/v2/everything',
      queryParams,
    );

    var response = await http.get(uri);

    var newsResponse = NewsResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return newsResponse;
    }

    if (newsResponse.message != null) {
      throw Exception(newsResponse.message);
    } else {
      throw Exception('error loading news source data');
    }
  }
}
