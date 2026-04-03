import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class ModelBottomSheetBodyWidget extends StatelessWidget {
  final Articles articles;
  const ModelBottomSheetBodyWidget({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric( vertical:10.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).indicatorColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: articles.urlToImage ?? "",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          color: Theme.of(context).indicatorColor,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        articles.description ?? "",
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                       
                        style: ElevatedButton.styleFrom(

                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: BorderSide(
                            color: Theme.of(context).indicatorColor,
                          ),
                          minimumSize: const Size(double.infinity, 60),
                        ),
                        onPressed: () {
                          launchUrl(
                            Uri.parse(articles.url ?? ""),
                            mode: LaunchMode.inAppWebView,
                          );
                        },
                        child: Text(
                          "View Full Article",
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                          SizedBox(height: 5),
                  ],
                )),
          ],
        );
  }
}