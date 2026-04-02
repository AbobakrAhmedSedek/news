import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/ui/home/category_fragment.dart';
import 'package:news_app/ui/home/drawer/home_drawer.dart';
import 'package:news_app/utils/app_colors.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                onCklick: onCategoryCklick, // stape: 3,
              )
            : CategoryDetails(
                category: categorySelected!, // stape: 13
              ));
  }

  Category? categorySelected; // stape: 5

  void onCategoryCklick(Category newCategorySelected) {   // stape: 4
  
    categorySelected = newCategorySelected; // stape: 6
    setState(() {});
  }

  void onDrowerMenuClick() {
    categorySelected = null;
    Navigator.pop( context);
    setState(() {});
  }
}
