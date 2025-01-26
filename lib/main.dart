import 'package:flutter/material.dart';
import 'package:placed_client/pages/homepage.dart';
import 'package:placed_client/pages/create_course.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255,71,149,57)),
        
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>HomePage(),
        '/createCourse':(context)=>CreateCourse(),

      } 
    );
  }
}

