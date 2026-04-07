import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/news_response.dart';

class SearchedArticlesDataSourse {
  static Future <List<Articles>?> getSearchedSourses(
      {required String searchQuery}) async {
    try {
      Uri url = Uri.https(
        ApiConstants.apiBaseUrl,
        EndPoints.apiNews,
        {"apiKey": EndPoints.apiKey, "q": searchQuery},
      );

      http.Response response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body)).articles;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
