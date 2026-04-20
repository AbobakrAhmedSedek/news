import 'package:news_app/model/news_response.dart';

abstract class NewsRepository {
Future<NewsResponse?> getArticlesByCategory(String categoryId);
}