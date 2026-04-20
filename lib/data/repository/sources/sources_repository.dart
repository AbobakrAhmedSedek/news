
import 'package:news_app/model/sourse_response.dart';

abstract class SourcesRepository { 
  Future<SourseResponse?> getSourcesByCategory( String categoryId)  ;
}