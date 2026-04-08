import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.whiteColor,
      indicatorColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        centerTitle: true,
      ), // AppBarTheme
      brightness: Brightness.light,
      textTheme: TextTheme(
        labelSmall: AppStyles.medium12gray,
        labelLarge: AppStyles.bold16Black,
        labelMedium: AppStyles.medium14black,
        headlineMedium: AppStyles.medium24Black,
        headlineLarge: AppStyles.medium20Black,
        titleLarge: AppStyles.large24White,
        titleMedium: AppStyles.medium14White
      ));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.blackColor,
      indicatorColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
      ), // AppBarTheme
      brightness: Brightness.dark,
      textTheme: TextTheme(
          labelSmall: AppStyles.medium12gray,
          labelLarge: AppStyles.bold16White,
          labelMedium: AppStyles.medium14White,
          headlineMedium: AppStyles.medium24White,
          headlineLarge: AppStyles.medium20White,
          titleLarge: AppStyles.large24black,
          titleMedium: AppStyles.medium14black
          ));
}
