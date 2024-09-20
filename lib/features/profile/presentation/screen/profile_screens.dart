import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_practice/localization/l10n/generated/l10n.dart';
import 'package:main_practice/features/auth/login/presentation/screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile_title), // Localized title
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).profile_welcome, // Localized welcome message
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (user != null)
                Text(
                  "Email: ${user.email}",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
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
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48), // Full-width button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
