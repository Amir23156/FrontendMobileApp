import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitrine_project/login.dart';
import 'package:get/get.dart';
import 'package:vitrine_project/home.dart';

class RegistrationPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegistrationPage({required this.showLoginPage});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      //FirebaseAuthException ([firebase_auth/weak-password] Password should be at least 6 characters)
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
            'Welcome to Vitrine',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Card(
          //   margin: EdgeInsets.all(20),
          //   child: Padding(
          //       padding: EdgeInsets.all(2),
          //       child: ListTile(
          //         leading: Icon(
          //           Icons.account_circle_outlined,
          //           color: Colors.black54,
          //         ),
          //         title: Text(
          //           "Enter your name",
          //           style: TextStyle(
          //             fontSize: 20.0,
          //             color: Colors.black54,
          //           ),
          //         ),
          //       )),
          // ),
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
          // Card(
          //   margin: EdgeInsets.all(20),
          //   child: Padding(
          //       padding: EdgeInsets.all(2),
          //       child: ListTile(
          //         leading: Image.asset(
          //           'images/hide.png',
          //           color: Colors.black54,
          //           width: 30.0,
          //           height: 60.0,
          //         ),
          //         title: Text(
          //           "Confirm your password",
          //           style: TextStyle(
          //             fontSize: 20.0,
          //             color: Colors.black54,
          //           ),
          //         ),
          //       )),
          // ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(280, 80),
              textStyle: TextStyle(fontSize: 28),
              backgroundColor: Color.fromARGB(0, 212, 172, 120),
              foregroundColor: Colors.white,
            ),
            // consider using: "Get.to(() => Page())" instead of "Get.to(Page())".
            // Using a widget function instead of a widget fully guarantees that
            //the widget and its controllers will be removed from memory when they are no longer used.
            onPressed: signUp,
            //  () {
            //   // Get.to(LoginPage());
            //   Get.to(() => HomePage());
            // },
            child: Text('Register'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Already have an account ?"),
            GestureDetector(
              onTap: widget.showLoginPage,
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.blue[500]),
              ),
            ),
          ]),
          // TextButton(
          //   onPressed: () {
          //     Get.to(() => LoginPage());
          //   },
          //   child: Text(
          //     'Already have an account ? Sign In',
          //     style: TextStyle(
          //       fontSize: 15.0,
          //       color: Colors.black54,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
