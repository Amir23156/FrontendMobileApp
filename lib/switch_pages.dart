import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitrine_project/home.dart';

import 'auth.dart';

class SwitchPages extends StatefulWidget {
  const SwitchPages({super.key});

  @override
  State<SwitchPages> createState() => _SwitchPagesState();
}

class _SwitchPagesState extends State<SwitchPages> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return AuthPage();
          }
        });
  }
}
