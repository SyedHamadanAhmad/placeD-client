import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:placed_client/models/courses.dart';
import 'package:placed_client/templates_lib/main_template.dart'; // Make sure to import the Courses model

class SavedCourses extends StatefulWidget {
  const SavedCourses({super.key});

  @override
  State<SavedCourses> createState() => _SavedCoursesState();
}

class _SavedCoursesState extends State<SavedCourses> {
  late Box<Courses> coursesBox;
  List<Courses> allCourses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  // Function to load courses from the Hive box
  Future<void> _loadCourses() async {
    coursesBox = await Hive.openBox<Courses>('courses');
    setState(() {
      allCourses = coursesBox.values.toList();
    });
  }

  // Function to delete a course
  Future<void> _deleteCourse(int index) async {
    final course = allCourses[index];
    final courseId = course.courseId;

    bool? confirmDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: Text('Do you want to delete the course: ${course.courseName}?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmDelete == true) {
      // Find the key for this course in the box
      final key = coursesBox.keys.firstWhere(
        (k) => coursesBox.get(k)?.courseId == courseId,
        orElse: () => -1,
      );
      
      if (key != -1) {
        await coursesBox.delete(key); // Delete using the correct key
        setState(() {
          allCourses.removeAt(index);
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Course "${course.courseName}" deleted!')),
          );
        }
      }
    }
    
}
 @override
Widget build(BuildContext context) {
  return MainTemplate(
    title: "placeD",
    currentIndex: 1,
   child: allCourses.isEmpty
    ? const Center(child: Text("No courses saved"))
    : SizedBox(
        height: MediaQuery.of(context).size.height * 0.8, // Set a height
        child: ListView.builder(
          itemCount: allCourses.length,
          itemBuilder: (context, index) {
            final course = allCourses[index];
            return ListTile(
              title: Text(course.courseName),
              subtitle: Text("Course ID: ${course.courseId}"),
              leading: Image.network(course.courseImg),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _deleteCourse(index),
              ),
              onTap: () {
                // Add your navigation or tap action here
              },
            );
          },
        ),
      ),

          );
}

}