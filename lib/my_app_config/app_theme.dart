import 'package:flutter/material.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';
import 'package:shaadi_book/my_app_config/app_font_family.dart';
import 'package:shaadi_book/my_app_config/app_font_size_constants.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColorConstant.primaryColor,
        // secondary: AppColorConstant.secondaryColor,
      ),
      // fontFamily: 'NunitoSansRegular',
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: AppFontSizeConstant.fontSize18,
          color: Colors.white,
        ),
        // centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColorConstant.primaryColor,
        // selectedItemColor: AppColorConstant.primaryColorLight,
        unselectedItemColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColorConstant.primaryColor),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontFamily: kantumruy,
              fontSize: AppFontSizeConstant.fontSize18,
              color: Colors.white,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColorConstant.primaryColor,
        elevation: 3.0,
      ),
      // textTheme: TextTheme(
      //   headline1: TextStyle(
      //       fontSize: 32.0,
      //       fontWeight: FontWeight.w700,
      //       color: AppColorConstant.fontColor1),
      //   headline2: TextStyle(
      //       fontSize: AppFontSizeConstant.fontSize24,
      //       fontWeight: FontWeight.w500,
      //       color: AppColorConstant.fontColor1,
      //       height: 1.5),
      //   headline3: TextStyle(
      //       fontSize: 22.0,
      //       fontWeight: FontWeight.w500,
      //       color: AppColorConstant.fontColor1),
      //   headline4: TextStyle(
      //       fontSize: AppFontSizeConstant.fontSize18,
      //       fontWeight: FontWeight.w500,
      //       color: AppColorConstant.fontColor1),
      //   bodyText1: TextStyle(
      //     fontSize: AppFontSizeConstant.fontSize14 - 2.0,
      //     color: Colors.black,
      //   ),
      //   bodyText2: TextStyle(
      //     fontSize: AppFontSizeConstant.fontSize14,
      //     color: AppColorConstant.primaryColor,
      //   ),
      //   button: TextStyle(
      //     color: AppColorConstant.fontColor1,
      //   ),
      // ),
    );
  }
}
