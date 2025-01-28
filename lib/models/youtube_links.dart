import 'package:hive/hive.dart';

part 'youtube_links.g.dart'; // Make sure this part file is generated

@HiveType(typeId: 1)
class YoutubeLinks extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String videoUrl;

  YoutubeLinks({required this.title, required this.videoUrl});
}
