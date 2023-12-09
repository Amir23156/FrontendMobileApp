import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitrine_project/home.dart';
import 'package:vitrine_project/registration.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2B48C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
                padding: EdgeInsets.all(2),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.black54,
                  ),
                  title: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        // enabledBorder: OutlineInputBorder(),
                        hintText: "Enter your email"),
                  ),
                )),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
                padding: EdgeInsets.all(2),
                child: ListTile(
                  leading: Image.asset(
                    'images/hide.png',
                    color: Colors.black54,
                    width: 30.0,
                    height: 60.0,
                  ),
                  title: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        // enabledBorder: OutlineInputBorder(),
                        hintText: "Enter your password"),
                  ),
                )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(280, 80),
              textStyle: TextStyle(fontSize: 28),
              backgroundColor: Color.fromARGB(0, 212, 172, 120),
              foregroundColor: Colors.white,
            ),
            onPressed: signIn,
            // () {
            //   Get.to(() => HomePage());
            // },
            child: Text('Login'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Don't have an account ?"),
            GestureDetector(
              onTap: widget.showRegisterPage,
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.blue[500]),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
