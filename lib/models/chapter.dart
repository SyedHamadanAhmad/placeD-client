import 'package:hive/hive.dart';
import 'youtube_links.dart'; // Import the YoutubeLinks class

part 'chapter.g.dart'; // Make sure this part file is generated

@HiveType(typeId: 2)
class Chapter extends HiveObject {
  @HiveField(0)
  String topicName;

  @HiveField(1)
  List<String> paragraphs;

  @HiveField(2)
  List<String> links;

  @HiveField(3)
  List<YoutubeLinks> ytLinks;

  Chapter(
      {required this.topicName,
      required this.paragraphs,
      required this.links,
      required this.ytLinks});
}
