import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/sources/sources_repository.dart';
import 'package:news_app/model/sourse_response.dart';

class SourcesRepositoryImpl implements SourcesRepository{
  
      @override
  Future<SourseResponse?> getSourcesByCategory(String categoryId) async {
    return await ApiManager.getSourses(categoryId); 
  }
}

