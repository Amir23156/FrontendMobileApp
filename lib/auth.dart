import 'package:flutter/material.dart';
import 'package:vitrine_project/login.dart';
import 'package:vitrine_project/registration.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially show the login page
  bool showLoginPage = true;

  void tagglescreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        showRegisterPage: tagglescreens,
      );
    } else {
      return RegistrationPage(
        showLoginPage: tagglescreens,
      );
    }
  }
}
