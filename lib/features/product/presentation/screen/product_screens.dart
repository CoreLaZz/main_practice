import 'package:flutter/material.dart';
import 'package:main_practice/l10n/generated/l10n.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home_title),
      ),
      body: Center(
        child: Text(
          S.of(context).home_welcome,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
