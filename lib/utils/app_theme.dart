import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparentColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
    ),
    // this way use when the app has two modes(dark,light)
    // you can modify app font size from this parameter (textTheme)
    textTheme: TextTheme(headlineLarge: AppStyles.bold16White),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.blackBgColor,
      iconTheme: IconThemeData(color: AppColor.primColor),
    ),
  );
}
