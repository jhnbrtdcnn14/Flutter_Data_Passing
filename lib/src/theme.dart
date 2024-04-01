import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkgrey, // Background color for Scaffold
  appBarTheme:
      AppBarTheme(backgroundColor: AppColors.semidarkgrey), // AppBar background
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: AppColors.darkgrey),
  primaryColor: AppColors.lightgreen,
);
