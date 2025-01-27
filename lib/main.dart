import 'package:flutter/material.dart';
import 'package:placed_client/pages/homepage.dart';
import 'package:placed_client/pages/create_course.dart';
import 'package:placed_client/pages/course_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 71, 149, 57),
        ),
      ),
      initialRoute: '/',
      // Use routes for static routes
      routes: {
        '/': (context) => HomePage(),
        '/createCourse': (context) => CreateCourse(),
        
      },
      
      
    );
  }
}

