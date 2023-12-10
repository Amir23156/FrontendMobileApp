import 'package:flutter/material.dart';
import 'package:vitrine_project/home.dart';
import 'package:vitrine_project/navigationbar.dart';

class InstructorProfile extends StatelessWidget {
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
      body: ListView(
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
                  'Instructor Profile',
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
          InfoBoxWidget(
            information1: 'Rating',
            information2: 'Last Month Income',
            number: 5000,
            starnumber: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Most rated Courses',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Wrap the ListView.builder with an Expanded widget
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: BoxWidget(
                      name: 'chess',
                      imagePath: 'images/chess.jpg',
                    ),
                  ),
                  SizedBox(width: 8.0), // Adjust the spacing between the boxes
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
        color: Color.fromARGB(255, 147, 160,
            170), // You can change the color or add a background image if needed
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
        color: Color.fromARGB(255, 190, 201, 209), // Add your box color
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

class InfoBoxWidget extends StatelessWidget {
  final String information1;
  final String information2;
  final int number;
  final int starnumber;

  InfoBoxWidget({
    required this.information1,
    required this.information2,
    required this.number,
    required this.starnumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 197, 209, 219),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                information1,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8.0), // Add some spacing between text and stars
              // Display stars based on starnumber
              for (int i = 0; i < starnumber; i++)
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20.0,
                ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                information2,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '$number', // Display the number here
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
