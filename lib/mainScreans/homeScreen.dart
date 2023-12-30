import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_otp/mainScreans/Ai_screen.dart';
import 'package:user_otp/mainScreans/postsScreen.dart';
import 'package:user_otp/mainScreans/profileScreen.dart';
import '../prividers/my_theme_providers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> Tabs = [AiScreen(), PostsScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<MyThemeProvider>(context);
    Color color = themeStatus.themeType ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "ChatGPT",
          style: TextStyle(color: color),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (themeStatus.themeType) {
                  themeStatus.setTheme = false;
                } else {
                  themeStatus.setTheme = true;
                }
              },
              icon: Icon(
                themeStatus.themeType
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                color: color,
              ))
        ],
      ),
      body: Tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: color,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "A I chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add_sharp), label: "posts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          print(selectedIndex);
        },
      ),
    );
  }
}
