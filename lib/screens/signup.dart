import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main_practice/auth/firebaseservice.dart';
import 'package:main_practice/features/custom/widgets/nav_bottom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        elevation: 5,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          _emailTextField,
          _passwordTextField,
          SizedBox(
            height: 10,
          ),
          _registerButton
        ],
      ),
    );
  }

  Widget get _emailTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _email,
        decoration: InputDecoration(hintText: "Email"),
      ),
    );
  }

  Widget get _passwordTextField {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _password,
        decoration: InputDecoration(hintText: "Password"),
      ),
    );
  }

  Widget get _registerButton {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
            onPressed: () {
              onRegisterClick();
            },
            child: Text("Register")),
      ),
    );
  }

  void onRegisterClick() {
    String email = _email.text;
    String password = _password.text;

    FirebaseAuthService()
        .registerWithEmail(email, password)
        .then((userCredential) {
      print("User: ${userCredential.user?.email}");
      print("Registration Successful");

      // Navigate to NavBottomPage on successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavBottomPage()),
      );
    }).catchError((error) {
      final dialog = AlertDialog(
        title: Icon(Icons.cancel, color: Colors.red),
        content: Text("Registration Failed: $error"),
      );
      showDialog(context: context, builder: (BuildContext context) => dialog);
    });
  }
}
