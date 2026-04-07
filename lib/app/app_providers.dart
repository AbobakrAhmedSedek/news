import 'package:flutter/material.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: child,
    );
  }
}
