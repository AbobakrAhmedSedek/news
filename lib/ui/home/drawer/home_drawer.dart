import 'package:flutter/material.dart';
import 'package:news_app/ui/home/widget/bottom_sheet_widget.dart';
import 'package:news_app/ui/home/widget/drawer_item_widget.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/asses_managment.dart';

class HomeDrawer extends StatelessWidget {
  final Function onDrowerMenuClick;

  const HomeDrawer({super.key, required this.onDrowerMenuClick});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.25,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Text(
            "News App",
            style: AppStyles.bold24Black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.01 , horizontal: width * 0.04),
          child: Row(
            children: [
              Image.asset(AssetsManager.homeIcon),
              TextButton(
                onPressed: () {
                  onDrowerMenuClick();
                },
                child: Text(
                  "Go to Home",
                  style: AppStyles.bold20White,
                ),
              ),
            ],
          ),
        ),
      
        Divider(
          endIndent: width * 0.04,
          indent: width * 0.04,
        ),
      
        DrawerItem( image: AssetsManager.themeIcon, text: "Theme",),
      
        BottomSheetWidget(text: "Language", onPressed: (){}),
         SizedBox(  height: height*0.02 , ),
        Divider(
          endIndent: width * 0.04,
          indent: width * 0.04,
        ),
      
        DrawerItem( image: AssetsManager.languageIcon, text: "Language",),
      
        BottomSheetWidget(text: "Language", onPressed: (){}),
      ],
    );
  }
}
