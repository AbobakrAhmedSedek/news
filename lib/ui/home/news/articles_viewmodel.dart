import 'package:flutter/material.dart';
import 'package:news_app/data/repository/news/news_repository.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/request_state.dart';

class ArticlesViewmodel extends ChangeNotifier {
  final NewsRepository newsRepository;
  RequestState<List<Articles>> newsState = LoadingState();

  ArticlesViewmodel(this.newsRepository);

  Future<void> getNewsBySourseId(String sourseId) async {
    newsState = LoadingState();
    notifyListeners();
    try {
      final response = await newsRepository.getArticlesByCategory(sourseId);
      if (response?.status == "ok") {
        newsState = SuccessState(response!.articles ?? []);
      } else {
        newsState = ErrorState(response!.message ?? "");
      }
    } catch (error) {
      newsState = ErrorState(error.toString());
    }
    notifyListeners();
  }
}
