import 'package:flutter/material.dart';
import 'package:vitrine_project/home.dart';
import 'package:vitrine_project/shared/barre_de_recherche.dart';

class UserProfile extends StatelessWidget {
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                'images/book.png',
                height: 20,
                width: 20,
              ),
            ),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Color(0xFFF2F2F2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      size: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'User Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ProfilePictureWidget(
            imagePath:
                'images/userProfilePicture.jpg', // Replace with the actual path to the user's profile picture
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserStatusLabel(label: 'Expert User'),
              SizedBox(width: 16.0),
              UserStatusLabel(label: 'Legendary User'),
            ],
          ),
          SizedBox(height: 8.0),
          ExperienceBar(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Favorite Courses',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
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
    );
  }
}

class ProfilePictureWidget extends StatelessWidget {
  final String imagePath;

  ProfilePictureWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors
            .blue, // You can change the color or add a background image if needed
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
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
        color: Colors.blue, // Add your box color
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

class UserStatusLabel extends StatelessWidget {
  final String label;

  UserStatusLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ExperienceBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with the actual user's experience and maximum experience values
    double currentExperience = 3000;
    double maxExperience = 5000;

    double progress = currentExperience / maxExperience;

    return Container(
      width: 300.0,
      height: 20.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Container(
            width: 300.0 * progress,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
