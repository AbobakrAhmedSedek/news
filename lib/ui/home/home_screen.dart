import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/ui/home/category_fragment.dart';
import 'package:news_app/ui/home/drawer/home_drawer.dart';
import 'package:news_app/ui/home/search/search_screen.dart';
import 'package:news_app/ui/home/sourses/sourse_view.dart';
import 'package:news_app/utils/app_colors.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [ IconButton(onPressed: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
            // showSearch(context: context, delegate: SearchNewsDelegate());
          }, icon: const Icon(Icons.search))],
          title:
              Text( categorySelected == null?
                'Home ' : categorySelected!.name! , style: Theme.of(context).textTheme.headlineLarge),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.blackColor,
          child: HomeDrawer(
            onDrowerMenuClick: onDrowerMenuClick,
          ),
        ),
        body: categorySelected == null
            ? // stape: 7
            CategoryFragment(
                onCklick: onCategoryCklick, 
              )
            : SourseView(
                category: categorySelected!, 
              ));
  }

  Category? categorySelected; 

  void onCategoryCklick(Category newCategorySelected) {  
    categorySelected = newCategorySelected; 
    setState(() {});
  }

  void onDrowerMenuClick() {
    categorySelected = null;
    Navigator.pop( context);
    setState(() {});
  }
}
