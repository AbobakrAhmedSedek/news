import 'package:flutter/material.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: context.read<SearchProvider>().searchController,
        cursorColor: Theme.of(context).indicatorColor,
        cursorRadius: Radius.circular(16.0),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          context.read<SearchProvider>().searchArticles();
          // Navigator.pop(context);

          },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
              color: Theme.of(context).indicatorColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
              color: Theme.of(context).indicatorColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
              color: Theme.of(context).indicatorColor,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).indicatorColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear_rounded,
              color: Theme.of(context).indicatorColor,
            ),
            color: Theme.of(context).indicatorColor,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.titleSmall,
        ));
  }
}
