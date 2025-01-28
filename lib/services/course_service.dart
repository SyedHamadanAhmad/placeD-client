import 'package:hive/hive.dart';
import '../models/courses.dart'; // Make sure to import the Course model

class CourseService {
  static Box<Courses>? _coursesBox;

  // Initialize Hive box for courses
  static Future<void> openBox() async {
    try {
      _coursesBox = await Hive.openBox<Courses>('courses');
    } catch (e) {
      print('Error opening box: $e');
      rethrow;
    }
  }

  // Add a course to the box
  static Future<void> addCourse(Courses course) async {
    try {
      await _coursesBox?.add(course);
    } catch (e) {
      print('Error adding course: $e');
    }
  }

  // Retrieve all courses from the box
  static List<Courses> getAllCourses() {
    return _coursesBox?.values.toList() ?? [];
  }

  // Update a course in the box
  static Future<void> updateCourse(int index, Courses updatedCourse) async {
    try {
      await _coursesBox?.putAt(index, updatedCourse);
    } catch (e) {
      print('Error updating course: $e');
    }
  }

  // Delete a course from the box
  static Future<void> deleteCourse(int index) async {
    try {
      await _coursesBox?.deleteAt(index);
    } catch (e) {
      print('Error deleting course: $e');
    }
  }

  // Close the Hive box
  static Future<void> closeBox() async {
    try {
      await _coursesBox?.close();
    } catch (e) {
      print('Error closing box: $e');
      rethrow;
    }
  }
}
