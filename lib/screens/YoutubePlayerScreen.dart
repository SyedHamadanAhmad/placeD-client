import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerScreen extends StatefulWidget {
  final String videoId; // The ID of the YouTube video you want to play

  const YouTubePlayerScreen({super.key, required this.videoId});

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the YouTube player controller
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId, // YouTube video ID
      flags: YoutubePlayerFlags(
        autoPlay: false, // Do not autoplay the video
        mute: false, // Video sound is enabled
        enableCaption: true, // Enable captions if available
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Player'),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true, // Show the progress bar
        progressColors: ProgressBarColors(
          playedColor: Colors.red, // Color for the played section
          handleColor: Colors.redAccent, // Color for the progress handle
        ),
        onReady: () {
          print('Player is ready.');
        },
      ),
    );
  }
}
