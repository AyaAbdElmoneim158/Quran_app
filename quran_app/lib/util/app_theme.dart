import 'package:flutter/material.dart';

// https://www.christianfindlay.com/blog/flutter-mastering-material-design3
//https://rydmike.com/blog_theming_guide.html
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.kWitheColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.kWitheColor,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.kPurpleD3Color),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.kWitheColor,
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColors.kPurpleD6Color),
            titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.kPurpleD3Color),
            bodySmall: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.kPurpleD6Color),
            bodyMedium: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.kTextMediumColor),
            bodyLarge: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.kPurpleD6Color),
            labelLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.kPurpleD2Color)),
      );
  static ThemeData darkTheme() => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.kbgDarkColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.kbgDarkColor,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.kWitheColor),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.kbgDark2Color,
            type: BottomNavigationBarType.fixed),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColors.kWitheColor),
            titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.kWitheColor),
            bodySmall: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.kWitheColor),
            bodyMedium: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColors.kTextDarkColor),
            bodyLarge: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.kWitheColor),
            labelLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.kWitheColor)),
      );
}
