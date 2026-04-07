
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/ui/home/search/searched_articles_data_sourse.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final SearchedArticlesDataSourse searchedArticlesDataSourse =
      SearchedArticlesDataSourse();

  List<Articles> searchedArticles = [];
  bool isLoading = false;
  String? errorMessage = '';

  Future<void> getSearchedArticles() async {
    searchedArticles = [];
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      searchedArticles = await (SearchedArticlesDataSourse.getSearchedSourses(
              searchQuery: searchController.text)) ??
          [];
      isLoading = false;
      notifyListeners();
    } on ClientException catch (error) {
      errorMessage =
          "some thing went wrong with the server try again later ${error.message}";
    } catch (error) {
      if (error is TypeError) {
        errorMessage = "error formating the recived data ";
      } else {
        print(' xx -> ${error.runtimeType} ');
        errorMessage = error is String ? error : "some thing went wrong ";
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
