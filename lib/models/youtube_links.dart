import 'package:hive/hive.dart';

part 'youtube_links.g.dart'; // Make sure this part file is generated

@HiveType(typeId: 1)
class YoutubeLinks extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String video_url;

  YoutubeLinks({required this.title, required this.video_url});

  factory YoutubeLinks.fromJson(Map<String, dynamic> json) {
    return YoutubeLinks(
      title: json['title'] ?? '',
      video_url: json['video_url'] ?? '',
    );
  }
}
