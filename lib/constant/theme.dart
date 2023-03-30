import 'package:blog_app/constant/constant.dart';
import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: ConstantSolidColor.primaryColor, width: 1.5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ConstantSolidColor.colorTitle;
          }
          return ConstantSolidColor.primaryColor;
        })),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white70,
        size: 16,
      ),
      fontFamily: 'dana',
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: ConstantSolidColor.appBarIconColor),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: ConstantSolidColor.subHeadText,
        ),
        displayMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 11,
          color: Colors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          color: ConstantSolidColor.displayLargText,
        ),
      ));
}
