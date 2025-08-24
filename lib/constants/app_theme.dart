import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_styles.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'OpenSans',

      // 🌟 Updated colors
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: AppColor.background,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.white,
        elevation: 0,
        titleTextStyle: getLargeTextStyle(
          color: AppColor.white,
          fontSize: 16.0,
        ),
      ),

      textTheme: TextTheme(
        displayLarge: getExtraLargeTextStyle(
          fontSize: 23.0,
          color: AppColor.black,
        ),
        displayMedium: getLargeTextStyle(
          color: AppColor.black,
          fontSize: 16.0,
        ),
        bodyLarge: getMediumTextStyle(
          color: AppColor.grey,
          fontSize: 14.0,
        ),
        bodyMedium: getSmallTextStyle(
          color: AppColor.grey,
          fontSize: 12.0,
        ),
      ),

      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.white,
          textStyle: getLargeTextStyle(
            fontSize: 16.0,
            color: AppColor.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        hintStyle: getSmallTextStyle(
          fontSize: 12.0,
          color: AppColor.grey,
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      dividerColor: AppColor.border,
    );
  }
}
