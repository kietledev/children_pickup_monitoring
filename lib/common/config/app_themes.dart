import '../constants/constants.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get light {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: Color(0xFF757575)),
      gapPadding: 10,
    );
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: FontsConstants.notoSans,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Color(0xFF757575)),
          bodyText2: TextStyle(color: Color(0xFF757575)),
          headline1:
              TextStyle(fontSize: 16.0, fontFamily: FontsConstants.notoSans),
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }));
  }
}
