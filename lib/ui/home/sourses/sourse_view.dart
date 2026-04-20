import 'package:flutter/material.dart';
import 'package:news_app/data/repository/sources/sources_repository_impl.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/request_state.dart';
import 'package:news_app/model/sourse_response.dart';
import 'package:news_app/ui/home/sourses/sourse_viewmodel.dart';
import 'package:news_app/ui/home/sourses/widget/sourse_tap_widget.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SourseView extends StatefulWidget {
  final Category category;
  const SourseView({super.key, required this.category});

  @override
  State<SourseView> createState() => _SourseViewState();
}

class _SourseViewState extends State<SourseView> {
  final SourseViewmodel sourseViewmodel =
      SourseViewmodel(SourcesRepositoryImpl());

  @override
  void initState() {
    super.initState();
    sourseViewmodel.getSourcesByCategory(widget.category.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sourseViewmodel,
      child: Consumer<SourseViewmodel>(
        builder: (context, sourseViewmodel, child) {
          switch (sourseViewmodel.sourcesState) {
            case LoadingState():
              return const Center(child: CircularProgressIndicator());
            case ErrorState(message: final message):
              return Column(
                children: [
                  Text(
                    message,
                    style: AppStyles.medium20Black,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        sourseViewmodel
                            .getSourcesByCategory(widget.category.id ?? "");
                      },
                      child: const Text("Retry"))
                ],
              );
            case SuccessState<List<Source>>(data: final sources):
              return SourseTapWidget(
                sourceList: sources,
              );
          }
        },
      ),
    );
  }
}
