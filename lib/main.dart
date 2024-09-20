import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:main_practice/features/_widgets/nav_bottom.dart';
import 'package:main_practice/features/auth/login/presentation/screen/login_screen.dart';
import 'package:main_practice/firebase_options.dart';
import 'package:main_practice/localization/l10n/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'localization/script/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'Main Practice',
      locale: localeProvider.locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;

          // Check if the user is logged in
          if (user != null) {
            return NavBottomPage(); // User is logged in, show main app
          } else {
            return LoginScreen(); // User is not logged in, show login screen
          }
        }
        // While waiting for authentication state to be established
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
