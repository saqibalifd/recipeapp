import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.greenColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.greenColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.whiteColor,
      titleTextStyle: TextStyle(
          color: AppColors.greenColor,
          fontSize: 22,
          fontWeight: FontWeight.bold),
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
        iconColor: AppColors.greyColor, textColor: AppColors.greyColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.greenColor,
      foregroundColor: AppColors.greyColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.greyColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greenColor,
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
      labelStyle: const TextStyle(color: AppColors.greyColor),
      hintStyle: const TextStyle(color: AppColors.greyColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.greyColor,
      unselectedItemColor: AppColors.greyColor,
    ),
    textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 12,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            fontSize: 17,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            fontSize: 15,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w500)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor),
        ),
        foregroundColor: WidgetStatePropertyAll(AppColors.blackColor),
        backgroundColor: WidgetStatePropertyAll(AppColors.greenColor),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: AppColors.greenColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(color: AppColors.blackColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.redColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    cardColor: AppColors.greenColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.blackColor,
      titleTextStyle: TextStyle(
          color: AppColors.redColor, fontSize: 22, fontWeight: FontWeight.bold),
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
        iconColor: AppColors.whiteColor, textColor: AppColors.whiteColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.greenColor,
      foregroundColor: AppColors.whiteColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greenColor,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greenColor),
          borderRadius: BorderRadius.circular(8)),
      labelStyle: const TextStyle(color: AppColors.whiteColor),
      hintStyle: const TextStyle(color: AppColors.greyColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.greyColor,
      selectedItemColor: AppColors.greenColor,
      unselectedItemColor: AppColors.greyColor,
    ),
    textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 12,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
            fontSize: 17,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            fontSize: 15,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w500)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        foregroundColor: WidgetStatePropertyAll(AppColors.whiteColor),
        backgroundColor: WidgetStatePropertyAll(AppColors.redColor),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: AppColors.redColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(color: AppColors.whiteColor),
    ),
  );
}
