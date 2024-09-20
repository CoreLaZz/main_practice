import 'package:flutter/material.dart';
import 'package:main_practice/features/home/presentation/screen/home_screens.dart';
import 'package:main_practice/features/product/presentation/screen/product_screens.dart';
import 'package:main_practice/features/profile/presentation/screen/profile_screens.dart';
import 'package:main_practice/features/setting/presentation/screen/setting_screens.dart';
import 'package:main_practice/localization/l10n/generated/l10n.dart';

class NavBottomPage extends StatefulWidget {
  @override
  _NavBottomPageState createState() => _NavBottomPageState();
}

class _NavBottomPageState extends State<NavBottomPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ProductScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: S.of(context).home_nav,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: S.of(context).product_nav,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: S.of(context).profile_nav,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: S.of(context).setting_nav,
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
