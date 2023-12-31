import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_otp/authertication/authertication_provider.dart';
import 'package:user_otp/authertication/user_information.dart';
import 'package:user_otp/constants/constants.dart';
import 'package:user_otp/firebase_options.dart';
import 'package:user_otp/mainScreans/homeScreen.dart';
import 'package:user_otp/prividers/my_theme_providers.dart';
import 'package:user_otp/themes/my_themes.dart';
import 'authertication/registeration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MyThemeProvider()),
      ChangeNotifierProvider(create: (_) => AutherTicatationProvider())
    ],
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
          initialRoute: Constants.registrationPage,
          routes: {
            Constants.registrationPage: (context) => Registeration(),
            Constants.homeScreen: (context) => HomeScreen(),
            Constants.userinformation: (context) => UserInformation()
          },
        );
      },
    );
  }
}
