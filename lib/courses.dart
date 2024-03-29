import 'package:flutter/material.dart';
import 'package:vitrine_project/AddCourse.dart';
import 'package:vitrine_project/navigationbar.dart';
import 'package:vitrine_project/shared/barre_de_recherche.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD2B48C),
        title:
            Text('Skill boost', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/Logoskillboost.png', // Replace with the actual path to your logo
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        children: [
          BarreDeRecherche(
            filterList: (String value) {
              // Handle the filtering logic here
            },
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:
                  10, // Replace with the actual number of pairs of boxes you want
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: BoxWidget(
                        name: 'chess',
                        imagePath: 'images/chess.jpg',
                      ),
                    ),
                    SizedBox(
                        width: 8.0), // Adjust the spacing between the boxes
                    Expanded(
                      child: BoxWidget(
                        name: 'cooking',
                        imagePath: 'images/cooking.jpg',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AddCourse page when FloatingActionButton is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddCourse(), // Replace with your AddCourse page
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class BoxWidget extends StatelessWidget {
  final String name;
  final String imagePath;

  BoxWidget({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 150.0, // Adjust the width of your box
      decoration: BoxDecoration(
        color: Colors.white, // Add your box color
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 100.0, // Adjust the height of the image
            width: 100.0, // Adjust the width of the image
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
