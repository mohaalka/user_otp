import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_otp/authertication/user_information.dart';
import 'package:user_otp/mainScreans/homeScreen.dart';
import 'package:user_otp/prividers/my_theme_providers.dart';
import 'package:user_otp/themes/my_themes.dart';

import 'authertication/registeration.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MyThemeProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  void getCurrentTheme() async {
    await Provider.of<MyThemeProvider>(context, listen: false).getThemeStatus();
  }

  Widget build(BuildContext context) {
    return Consumer<MyThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              Mytheme.themeData(isDarkTheme: value.themeType, context: context),
          home: const UserInformation(),
        );
      },
    );
  }
}
