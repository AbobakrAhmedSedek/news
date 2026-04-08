import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/ui/home/search/searched_articles_data_sourse.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final SearchedArticlesDataSourse searchedArticlesDataSourse =
      SearchedArticlesDataSourse();
  final ScrollController scrollController = ScrollController();

  List<Articles> newArticles = [];
  bool isLoading = false;
  String? errorMessage = '';
  int page = 1;
  bool pagaintionLoading = false;
  SearchProvider() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;

        if (!isTop && !pagaintionLoading) { // stape : 3 ==> { && !pagaintionLoading}
          page++;
          pagaintionLoading = true;
          notifyListeners();
          getSearchedArticles();
        }
      }
    });
  }

  Future<void> searchArticles() async {
    page = 1;
    getSearchedArticles();
  }

  Future<void> getSearchedArticles() async {
    List<Articles> searchedArticles = [];
    errorMessage = null;
    if (newArticles.isEmpty) {
      isLoading = true;
      notifyListeners();
    }
    try {
      searchedArticles = await SearchedArticlesDataSourse.getSearchedSourses(
            searchQuery: searchController.text,
            page: page,
          ) ??
          [];
      // newArticles.addAll(searchedArticles);

      if (page == 1) {
        newArticles = searchedArticles;
      } else {
        newArticles.addAll(searchedArticles);
      }

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
    pagaintionLoading = false;
    notifyListeners();
  }
}
