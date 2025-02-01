import 'package:hive/hive.dart';
import 'youtube_links.dart'; // Import the YoutubeLinks class
part 'chapter.g.dart'; // Make sure this part file is generated

@HiveType(typeId: 2)
class Chapter extends HiveObject {
  @HiveField(0)
  String topic_name;

  @HiveField(1)
  List<String> paragraphs;

  @HiveField(2)
  List<String> links;

  @HiveField(3)
  List<YoutubeLinks> yt_links;

  Chapter(
      {required this.topic_name,
      required this.paragraphs,
      required this.links,
      required this.yt_links});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      topic_name: json['topic_name'] ?? '',
      paragraphs: List<String>.from(json['paragraphs'] ?? []),
      links: List<String>.from(json['links'] ?? []),
      yt_links: (json['yt_links'] as List)
          .map((ytLinkJson) => YoutubeLinks.fromJson(ytLinkJson))
          .toList(),
    );
  }
}
