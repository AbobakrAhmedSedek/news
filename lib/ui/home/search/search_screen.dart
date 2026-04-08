import 'package:flutter/material.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/ui/home/widget/custom_search_bar.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search_screen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: context.read<SearchProvider>().scrollController,
          slivers: [
            SliverAppBar(
              forceMaterialTransparency: true,
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              pinned: true,
              title: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).indicatorColor,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CustomSearchBar()),
              centerTitle: true,
            ),
            Consumer<SearchProvider>(builder: (context, searchProvider, child) {
              if (searchProvider.isLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (searchProvider.errorMessage != null) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(searchProvider.errorMessage!),
                  ),
                );
              }
              if (searchProvider.newArticles.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text("No results found"),
                  ),
                );
              }

              return SliverList.separated(
                // stape : 2 ==> {  +   (searchProvider.pagaintionLoading ? 1 : 0) }

                itemCount: searchProvider.newArticles.length +
                    (searchProvider.pagaintionLoading ? 1 : 0),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) {
                  // stape : 1  ==> 
                  //  { if (index == searchProvider.newArticles.length &&
                  //     searchProvider.pagaintionLoading) {
                  //   return const Padding(
                  //     padding: EdgeInsets.all(16.0),
                  //     child: Center(
                  //       child: CircularProgressIndicator(),
                  //     ),
                  //   );
                  // } }
                  if (index == searchProvider.newArticles.length &&
                      searchProvider.pagaintionLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return NewsItem(articles: searchProvider.newArticles[index]);
                },
              );
            })
          ]),
    );
  }
}
