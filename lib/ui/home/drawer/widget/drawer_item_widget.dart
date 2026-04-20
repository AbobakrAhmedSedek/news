import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final String image;
  final String text;
  const DrawerItem({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.04),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(
            width: width * 0.02,
          ),
          Text(
            text,
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
