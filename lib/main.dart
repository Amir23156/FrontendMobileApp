import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vitrine_project/registration.dart';
import 'package:vitrine_project/slash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFD2B48C)));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: RegistrationPage(),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => MySlashScreen())],
    );
  }
}