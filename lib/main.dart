import 'package:flutter/material.dart';
import 'package:news_app/app/app_providers.dart';
import 'package:news_app/app/my_app.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  WidgetsFlutterBinding.ensureInitialized();

  runApp(AppProviders(
    child:  const MyApp(),
  ));
}
