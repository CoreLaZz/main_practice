// lib/features/widgets/nav_bottom_page.dart

import 'package:flutter/material.dart';
import 'package:main_practice/generated/l10n.dart';
import 'package:main_practice/features/home/presentation/screen/home_screens.dart';
import 'package:main_practice/features/setting/presentation/screen/setting_screens.dart';

class NavBottomPage extends StatefulWidget {
  @override
  _NavBottomPageState createState() => _NavBottomPageState();
}

class _NavBottomPageState extends State<NavBottomPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: S.of(context).home_nav, // Localized string for home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: S.of(context).setting_nav, // Localized string for settings
          ),
        ],
      ),
    );
  }
}
