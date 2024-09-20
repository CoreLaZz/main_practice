import 'package:flutter/material.dart';
import 'package:main_practice/features/home/presentation/screen/home_screens.dart';
import 'package:main_practice/features/product/presentation/screen/product_screens.dart';
import 'package:main_practice/features/profile/presentation/screen/profile_screens.dart';
import 'package:main_practice/features/setting/presentation/screen/setting_screens.dart';

class AppRoutes {
  static const String home = '/home';
  static const String setting = '/settings';
  static const String product = '/product';
  static const String profile = '/product';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case setting:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case product:
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}
