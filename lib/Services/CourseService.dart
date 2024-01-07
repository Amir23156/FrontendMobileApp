import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart';

class CourseService {
  final String baseUrl;

  CourseService(this.baseUrl);

  Future<List<Course>> getAllCourses() async {
    final response = await http.get(Uri.parse('$baseUrl/getAllCourses'));

    if (response.statusCode == 200) {
      Iterable coursesJson = json.decode(response.body);
      List<Course> courses =
          coursesJson.map((course) => Course.fromJson(course)).toList();
      return courses;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<http.Response> addCourse(Course course) async {
    var response;
    try {
      var uri = Uri.parse('http://localhost:8080/api/courses/addCourse');
      Map<String, String> headers = {"Content-Type": "application/json"};
      /*final response = await http.post(
        Uri.parse('$baseUrl/addCourse'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(course.toJson()),
      );*/
      Map data = course.toJson();
      var body = json.encode(data);
      response = await http.post(uri, headers: headers, body: body);
      if (response.statusCode != 202) {
        throw Exception('Failed to ADD circuit breaker');
      }
    } catch (e) {
      print("Error adding course: $e");
      print(e);
    }
    return response;
  }

  Future<Course?> findCourseById(String courseId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/findCourseById/$courseId'));

    if (response.statusCode == 200) {
      return Course.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to find course');
    }
  }

  Future<void> deleteCourseById(String courseId) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/deleteCourse/$courseId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete course');
    }
  }

  Future<Course?> updateCourse(String courseId, Course updatedCourse) async {
    final response = await http.put(
      Uri.parse('$baseUrl/updateCourse/$courseId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedCourse.toJson()),
    );

    if (response.statusCode == 200) {
      return Course.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to update course');
    }
  }
}
