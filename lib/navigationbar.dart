import 'package:flutter/material.dart';
import 'package:vitrine_project/courses.dart';
import 'package:vitrine_project/home.dart';
import 'package:vitrine_project/instructorprofile.dart';
import 'package:vitrine_project/userprofile.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoursesPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                'images/book.png',
                height: 20,
                width: 20,
              ),
            ),
          ),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomePage(), // Replace with your Home Page
                ),
              );
            },
            child: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfile(),
                ),
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InstructorProfile(),
                ),
              );
            },
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
