import 'package:hive/hive.dart';
import 'chapter.dart'; // Import the Chapter class

part 'courses.g.dart'; // Make sure this part file is generated

@HiveType(typeId: 0)
class Courses extends HiveObject {
  @HiveField(0)
  String courseId;

  @HiveField(1)
  String courseName;

  @HiveField(2)
  String courseImg;

  @HiveField(3)
  List<Chapter> content;

  Courses(
      {required this.courseId,
      required this.courseName,
      required this.courseImg,
      required this.content});
}
