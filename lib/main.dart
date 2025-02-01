import 'package:flutter/material.dart';
import 'package:placed_client/models/chapter.dart';
import 'package:placed_client/models/courses.dart';
import 'package:placed_client/models/youtube_links.dart';
import 'package:placed_client/pages/homepage.dart';
import 'package:placed_client/pages/create_course.dart';
import 'package:placed_client/pages/course_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:placed_client/pages/resume_ques.dart';
import 'package:placed_client/services/latest_course_provider.dart';
import 'package:provider/provider.dart';
import 'services/course_service.dart';
import 'package:placed_client/pages/saved_courses.dart';
//import 'screens/YoutubePlayerScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:placed_client/pages/profile.dart';
import 'package:placed_client/models/user_model.dart';
import 'package:placed_client/course_catalog.dart';
import 'package:flutter/foundation.dart'; // Needed for kIsWeb


void main() async {
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(CoursesAdapter());
  Hive.registerAdapter(ChapterAdapter());
  Hive.registerAdapter(YoutubeLinksAdapter());
  await CourseService.openBox();
  if (kIsWeb) {
    // Web: Explicit FirebaseOptions required
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyByQmkTFq9PS3Yb0uLl2FokXHoXikUZuCw",
        authDomain: "placedserverv1.firebaseapp.com",
        projectId: "placedserverv1",
        storageBucket: "placedserverv1.firebasestorage.appT",
        messagingSenderId:  "593370143446",
        appId: "1:593370143446:web:4244e813c6b715a5730777",
      ),
    );
  }
  else{
    await Firebase.initializeApp();
  }
  
  await addDefaultCoursesToHive();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => LatestCourseProvider()),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> addDefaultCoursesToHive() async {
  var box = await Hive.openBox('catalogCourses');

  // Check if courses are already in the box to avoid duplicates
  if (box.isEmpty) {
    // Add the default courses to the box
    box.put('course001', course1);
    box.put('course002', course2);
    box.put('course003', course3);
  }
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
      builder: (context, child) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: child!,
          ),
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/createCourse': (context) => CreateCourse(),
        '/savedcourses': (context) => SavedCourses(),
        '/resumeQuesPage': (context) => ResumeQuesPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}