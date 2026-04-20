import 'package:flutter/material.dart';
import 'package:news_app/data/repository/sources/sources_repository.dart';
import 'package:news_app/model/request_state.dart';
import 'package:news_app/model/sourse_response.dart';

class SourseViewmodel extends ChangeNotifier {
  final SourcesRepository sourcesRepository;
  RequestState<List<Source>> sourcesState = LoadingState();
   
  SourseViewmodel(this.sourcesRepository);

  Future<void> getSourcesByCategory(String categoryId) async {
    sourcesState = LoadingState();
    notifyListeners();
    try {
    final response = await sourcesRepository.getSourcesByCategory(categoryId);
    if (response?.status == "ok") {
      sourcesState = SuccessState(response!.sources ?? []);
    } else {
      sourcesState = ErrorState(response!.message ?? "");
    }
  
  }
  catch(error){
    sourcesState = ErrorState(error.toString());
  
  }
    notifyListeners();
  }
}
