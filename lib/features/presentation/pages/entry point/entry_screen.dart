import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/home_page.dart';
import 'package:quizer/features/presentation/pages/category page/category_screen.dart';
import 'package:quizer/features/presentation/pages/leadboard%20page/leadboard_page.dart';
import 'package:quizer/features/presentation/pages/quiz setting page/quiz_setting_screen.dart';
import 'package:quizer/features/presentation/pages/setting page/setting_screen.dart';
import 'package:themed/themed.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _pages = [
    QuizSettingScreen(),
    CategoryScreen(),
    HomePage(),
    LeaderBoardScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: <Widget>[

          Icon(Icons.add, size: 30, color: getColor(0)),
          Icon(Icons.category_rounded, size: 30,
              color: getColor(1)),
          Icon(Icons.home, size: 30, color: getColor(2)),
          Icon(Icons.stacked_bar_chart, size: 30,
              color: getColor(3)),
          Icon(Icons.settings, size: 30, color: getColor(4)),
        ],
        backgroundColor: MyTheme.navigationBarBackground,
        buttonBackgroundColor: MyTheme.navigationBarForeground,
        color: MyTheme.navigationBarForeground,
        animationDuration: const Duration(milliseconds: 300),
        height: 50.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        index: _currentIndex,
      ),
    );
  }

  ColorRef getColor(int index) {
    if (index == _currentIndex) {
      return MyTheme.primaryButtonTextColor;
    } else {
      return MyTheme.backgroundColor1;
    }
  }
}
