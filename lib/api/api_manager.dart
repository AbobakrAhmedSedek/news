import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sourse_response.dart';

class ApiManager {
  static Future<SourseResponse?> getSourses(String categoryId) async {     // stape : 8

    try {
      Uri url = Uri.https(ApiConstants.apiBaseUrl, EndPoints.sourse,
          {"apiKey": EndPoints.apiKey,
           "category": categoryId});     // stape : 9


      http.Response response = await http.get(url);
      return SourseResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<NewsResponse?> getNewsBySourseId(String sourseId) async {
    try {
      Uri url = Uri.https(ApiConstants.apiBaseUrl, EndPoints.apiNews,
          {"apiKey": EndPoints.apiKey, "sources": sourseId});
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
