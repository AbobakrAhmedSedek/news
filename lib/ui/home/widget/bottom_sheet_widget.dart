import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class BottomSheetWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const BottomSheetWidget(
      {super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      padding: EdgeInsets.symmetric(horizontal: width * 0.04) ,
      height: height * 0.08,
      width: double.infinity,
      // color: AppColors.blackColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyles.medium20White,
          ),
          // Spacer( ),
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_drop_down,
                color: AppColors.whiteColor,
                size: 35, 
              ))
        ],
      ),
    );
  }
}
