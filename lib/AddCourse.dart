import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitrine_project/navigationbar.dart';
import '../../Services/CourseService.dart';
import 'courses.dart';
import 'models/course.dart';

class AddCourse extends StatefulWidget {
  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  late TextEditingController courseIdController;
  late TextEditingController courseNameController;
  late TextEditingController instructorsNameController;
  late TextEditingController instructorsIdController;

  @override
  void initState() {
    super.initState();
    courseIdController = TextEditingController();
    courseNameController = TextEditingController();
    instructorsNameController = TextEditingController();
    instructorsIdController = TextEditingController();
  }

  final CourseService apiService =
      CourseService("http://localhost:8080/api/courses");

  List<Instructor> createInstructorsList(List<String> ids, List<String> names) {
    // Ensure both lists have the same length
    assert(ids.length == names.length);

    List<Instructor> instructorsList = [];

    for (int i = 0; i < ids.length; i++) {
      instructorsList.add(Instructor(
        instructorId: ids[i],
        instructorName: names[i],
      ));
    }

    return instructorsList;
  }

  void add() async {
    // Create a list of instructor names from the text input
    List<String> instructorNames = instructorsNameController.text.split(',');
    List<String> instructorIds = instructorsIdController.text.split(',');
    // Create a Course object using the values from the text controllers
    List<Instructor> instructorList =
        createInstructorsList(instructorIds, instructorNames);
    Course course = Course(
      id: courseIdController.text,
      courseId: courseIdController.text,
      courseName: courseNameController.text,
      instructors: instructorList,
    );

    // Pass the Course object to the addCourse method
    await apiService.addCourse(course);

    // Navigate to the CoursesPage after adding the course
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CoursesPage(), // Replace with your course screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

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
          Column(
            children: <Widget>[
              Container(
                height: 50,
                color: Color(0xFFF2F2F2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
                      'Add Course',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Image.asset(
                    'images/book.png',
                    width: 150, // Adjust the width of the image as needed
                    height: 150, // Adjust the height of the image as needed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 14.2 * fem, 20 * fem),
                width: 310 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 55,
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 14.0),
                      decoration: BoxDecoration(
                        color: Color(0xffe7e7e7),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: TextField(
                        controller: courseIdController,
                        style: GoogleFonts.montserrat(
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2175 * ffem / fem,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter Course ID',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 14.0),
                      decoration: BoxDecoration(
                        color: Color(0xffe7e7e7),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: TextField(
                        controller: courseNameController,
                        style: GoogleFonts.montserrat(
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2175 * ffem / fem,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter Course Name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 14.0),
                      decoration: BoxDecoration(
                        color: Color(0xffe7e7e7),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: TextField(
                        controller: instructorsNameController,
                        style: GoogleFonts.montserrat(
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2175 * ffem / fem,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter Instructors Names',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 14.0),
                      decoration: BoxDecoration(
                        color: Color(0xffe7e7e7),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: TextField(
                        controller: instructorsIdController,
                        style: GoogleFonts.montserrat(
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2175 * ffem / fem,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter Instructors Id',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  add();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 75, 5),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
