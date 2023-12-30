import 'package:flutter/material.dart';

class Mytheme {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return isDarkTheme
        ? ThemeData(
            scaffoldBackgroundColor: Color(0xFF343541),
            primarySwatch: Colors.purple,
            primaryColorLight: Colors.deepPurple,
            dividerColor: Colors.white,
            disabledColor: Colors.grey,
            canvasColor: Colors.black,
            cardColor: Color(0xFF444654),
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(color: Color(0xFF444654)),
            buttonTheme: Theme.of(context)
                .buttonTheme
                .copyWith(colorScheme: const ColorScheme.dark()))
        : ThemeData(
            scaffoldBackgroundColor: Colors.grey.shade300,
            primarySwatch: Colors.purple,
            primaryColorLight: Colors.deepPurple,
            dividerColor: Colors.black,
            disabledColor: Colors.grey,
            canvasColor: Colors.grey[50],
            cardColor: Colors.grey,
            brightness: Brightness.light,
            appBarTheme: AppBarTheme(color: Colors.white),
            buttonTheme: Theme.of(context)
                .buttonTheme
                .copyWith(colorScheme: const ColorScheme.light()));
  }
}
