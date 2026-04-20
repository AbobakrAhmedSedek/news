import 'package:flutter/material.dart';
import 'package:news_app/data/repository/news/news_repository_impl.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/request_state.dart';
import 'package:news_app/model/sourse_response.dart';
import 'package:news_app/ui/home/news/articles_viewmodel.dart';
import 'package:news_app/ui/home/news/widget/news_item_widget.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class ArticlesView extends StatefulWidget {
  final Source source;

  const ArticlesView({required this.source,  super.key});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  final ArticlesViewmodel articlesViewmodel =
      ArticlesViewmodel(NewsRepositoryImpl());

  @override
  void initState() {
    super.initState();
    articlesViewmodel.getNewsBySourseId(widget.source.id ?? "");
  }
@override
void didUpdateWidget(ArticlesView oldWidget) {
  super.didUpdateWidget(oldWidget);
  if (oldWidget.source.id != widget.source.id) {
    articlesViewmodel.getNewsBySourseId(widget.source.id ?? "");
  }
}
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => articlesViewmodel,
      child: Consumer<ArticlesViewmodel>(
        builder: (context, sourseViewmodel, child) {
          switch (articlesViewmodel.newsState) {
            case LoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ErrorState(message: final message):
              return Column(
                children: [
                  Text(
                    message,
                    style: AppStyles.medium20Black,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        articlesViewmodel
                            .getNewsBySourseId(widget.source.id ?? "");
                        setState(() {});
                      },
                      child: const Text("Retry"))
                ],
              );
            case SuccessState<List<Articles>>(data: final articles):
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return NewsItemWidget(articles: articles[index]);
                },
              );
          }
        },
      ),
    );
  }
}
