import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/news/news_repository.dart';
import 'package:news_app/model/news_response.dart';

class NewsRepositoryImpl  implements NewsRepository{
  @override
  Future<NewsResponse?> getArticlesByCategory(String categoryId)  async{
  return await ApiManager.getNewsBySourseId(categoryId);
  }
}