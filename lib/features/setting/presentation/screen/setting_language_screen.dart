// lib/features/setting/presentation/screen/language_selection_page.dart
import 'package:flutter/material.dart';
import 'package:main_practice/generated/l10n.dart';
import 'package:main_practice/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).language),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(S.of(context).english),
            onTap: () {
              localeProvider.setLocale(Locale('en', ''));
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(S.of(context).khmer),
            onTap: () {
              localeProvider.setLocale(Locale('km', ''));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
