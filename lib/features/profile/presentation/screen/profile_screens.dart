import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_practice/localization/l10n/generated/l10n.dart';
import 'package:main_practice/features/auth/login/presentation/screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile_title), // Localized title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).profile_welcome, // Localized welcome message
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              "Email: ${FirebaseAuth.instance.currentUser?.email}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), // Redirect to login
                );
              },
              child: Text(S.of(context).logout), // Localized logout button
            ),
          ],
        ),
      ),
    );
  }
}
