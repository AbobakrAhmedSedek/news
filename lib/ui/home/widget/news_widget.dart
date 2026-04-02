import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sourse_response.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/utils/app_styles.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});
  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsBySourseId(widget.source.id ?? ""),
        builder: (BuildContext context, AsyncSnapshot<NewsResponse?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          if (snapshot.data?.status == "error") {
            return Column(
              children: [
                Text(
                  snapshot.data!.message!,
                  style: AppStyles.medium20Black,
                ),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourseId(widget.source.id ?? "");
                      setState(() {});
                    },
                    child: const Text("Retry"))
              ],
            );
          }
          List<Articles>? articles = snapshot.data?.articles ?? [];  
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return NewsItem(articles: articles[index]);
              });
        });
  }
}
