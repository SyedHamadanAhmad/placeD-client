import 'package:hive/hive.dart';
import 'chapter.dart';
part 'courses.g.dart'; // Make sure this part file is generated

@HiveType(typeId: 0)
class Courses extends HiveObject {
  @HiveField(0)
  String courseId;

  @HiveField(1)
  String courseName;

  @HiveField(2)
  int? lastIndex;

  @HiveField(3)
  String courseImg;

  @HiveField(4)
  List<Chapter> content;

  Courses(
      {required this.courseId,
      this.lastIndex,
      required this.courseName,
      required this.courseImg,
      required this.content});
}
