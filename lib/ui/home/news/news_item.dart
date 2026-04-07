import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/ui/home/widget/model_bottom_sheet_body_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Articles articles;
  const NewsItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        showArticleBottomSheet(context, articles);
      },
      child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).indicatorColor),
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? "",
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: Theme.of(context).indicatorColor,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  articles.title ?? "",
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(children: [
                Expanded(
                  child: Text(
                    articles.author != null && articles.author!.length > 20
                        ? " By : ${articles.author!.substring(0, 10)}..."
                        : " By : ${articles.author ?? 'Unknown'}",
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                    timeago.format(DateTime.parse(
                      articles.publishedAt ?? "",
                    )),
                    style: Theme.of(context).textTheme.labelSmall),
              ])
            ],
          )),
    );
  }

  void showArticleBottomSheet(BuildContext context, Articles articles) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return ModelBottomSheetBodyWidget( articles: articles);
      },
    );
  }
}
