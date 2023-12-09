import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitrine_project/registration.dart';
import 'package:vitrine_project/switch_pages.dart';

class MySlashScreen extends StatefulWidget {
  const MySlashScreen({super.key});

  @override
  State<MySlashScreen> createState() => _MySlashScreenState();
}

class _MySlashScreenState extends State<MySlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2B48C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.asset(
              'images/logo1.png', // Replace with the path to your image asset
              width: 400.0, // Set the width of the image
              height: 400.0, // Set the height of the image
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(280, 80),
              textStyle: TextStyle(fontSize: 28),
              backgroundColor: Color.fromARGB(0, 212, 172, 120),
              foregroundColor: Colors.white,
            ),
            onPressed: () => Get.to(() => SwitchPages()),
            child: Text('GET STARTED'),
          )
        ],
      ),
    );
  }
}
