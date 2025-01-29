import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Add this import for the player
import 'package:url_launcher/url_launcher.dart'; // Import for URL launcher
import 'package:placed_client/models/courses.dart';
import 'package:hive/hive.dart';
import 'package:placed_client/models/chapter.dart';
import 'package:placed_client/models/youtube_links.dart';



class CoursePage extends StatefulWidget {
  late  String courseId;
  late String courseName;
  late String courseImage;
  late List<Chapter> chapters;

  CoursePage({
    super.key,
    required this.courseId,
    required this.courseImage,
    required this.courseName,
    required this.chapters,
  });

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late final PageController _pageController;
  late int _currentChapterIndex;
  YoutubePlayerController? _youtubePlayerController;

  // Cache common values
  final primaryGreen = const Color.fromARGB(255, 71, 149, 57);
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true);
    _currentChapterIndex = 0;
  }
  Future<void> _saveCoursetoHive() async {
    try{
      
      Box<Courses> coursesBox = await Hive.openBox<Courses>('courses');
      print("Entered _saveCoursetoHive() function");
      Courses toAdd=Courses(courseId: widget.courseId, courseName: widget.courseName, courseImg: widget.courseImage, content: widget.chapters);
      await coursesBox.put(toAdd.courseId, toAdd);
      print("Course added successfully with course ID: ${toAdd.courseId}");

      Courses? course = coursesBox.values.firstWhere(
      (element) => element.courseId == widget.courseId,
      orElse: () => Courses(courseId: '', courseName: '', lastIndex: 0, courseImg: '', content: []), // In case no course is found, return a default Courses object
    );
      
    }
    catch(e){
      print('Error saving course ${e}');
    }
  }
  @override
  void dispose() {
    _youtubePlayerController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  
  // Extract progress indicator to a separate widget for better performance
  Widget _buildProgressIndicator(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: index <= _currentChapterIndex ? primaryGreen : Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: index <= _currentChapterIndex ? Colors.white : Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Extract YouTube video widget to a separate stateful widget
  Widget _buildYoutubeVideo(YoutubeLinks ytLink) {
    final videoId = YoutubePlayer.convertUrlToId(ytLink.video_url);
    if (videoId == null) return const SizedBox.shrink();

    return _LazyYoutubePlayer(
      videoId: videoId,
      title: ytLink.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryGreen,
        title: Text(
          'Course: ${widget.courseName}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: List.generate(
                  widget.chapters.length,
                  (index) => _buildProgressIndicator(index),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                'Course Content',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.chapters.length,
                onPageChanged: (index) => setState(() => _currentChapterIndex = index),
                itemBuilder: (context, index) => _ChapterContent(
                  chapter: widget.chapters[index],
                  primaryGreen: primaryGreen,
                  buildYoutubeVideo: _buildYoutubeVideo,
                  onSave: _saveCoursetoHive,
                ),
              ),
            ),
            _NavigationButtons(
              currentIndex: _currentChapterIndex,
              totalChapters: widget.chapters.length,
              primaryGreen: primaryGreen,
              onPrevious: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              onNext: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Separate stateful widget for YouTube player to improve performance
class _LazyYoutubePlayer extends StatefulWidget {
  final String videoId;
  final String title;

  const _LazyYoutubePlayer({
    required this.videoId,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _LazyYoutubePlayerState createState() => _LazyYoutubePlayerState();
}

class _LazyYoutubePlayerState extends State<_LazyYoutubePlayer> {
  late YoutubePlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.play_circle_outline, color: Colors.red),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue[700],
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _isInitialized
            ? YoutubePlayer(controller: _controller)
            : GestureDetector(
                onTap: () => setState(() => _isInitialized = true),
                child: Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(Icons.play_arrow, size: 64, color: Colors.grey),
                  ),
                ),
              ),
      ],
    );
  }
}

// Separate stateless widget for chapter content
class _ChapterContent extends StatelessWidget {
  final Chapter chapter;
  final Color primaryGreen;
  final Widget Function(YoutubeLinks) buildYoutubeVideo;
  final VoidCallback onSave;
  const _ChapterContent({
    required this.chapter,
    required this.primaryGreen,
    required this.buildYoutubeVideo,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Align(
              alignment: Alignment.centerRight, // Aligns the button to the right side
              child: IconButton(
                icon: const Icon(Icons.download, color: Colors.blue), // Replace with download icon
                onPressed: () {
                  onSave();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Progress saved!')),
                  );
                },
              ),
            ),

            Text(
              chapter.topic_name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryGreen,
              ),
            ),
            const SizedBox(height: 20),
            ...chapter.paragraphs.map((paragraph) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    paragraph,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                )),
            if (chapter.links.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text(
                'Related Resources',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryGreen,
                ),
              ),
              const SizedBox(height: 12),
              ...chapter.links.map((link) => _ResourceLink(link: link)),
            ],
            if (chapter.yt_links.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text(
                'Video Resources',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryGreen,
                ),
              ),
              const SizedBox(height: 12),
              ...chapter.yt_links.map((ytLink) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: buildYoutubeVideo(ytLink),
                  )),
            ],
          ],
        ),
      ),
    );
  }
}

// Separate stateless widget for resource links
class _ResourceLink extends StatelessWidget {
  final String link;

  const _ResourceLink({required this.link, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () async {
          final Uri url = Uri.parse(link);
          try {
            if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
              print("Launched $link successfully");
            } else {
              print("Could not launch $link");
            }
          } catch (e) {
            print("Error launching URL: $e");
          }
        },
        child: Text(
          '• $link',
          style: TextStyle(
            fontSize: 15,
            color: Colors.blue[700],
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

// Separate stateless widget for navigation buttons
class _NavigationButtons extends StatelessWidget {
  final int currentIndex;
  final int totalChapters;
  final Color primaryGreen;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _NavigationButtons({
    required this.currentIndex,
    required this.totalChapters,
    required this.primaryGreen,
    required this.onPrevious,
    required this.onNext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (currentIndex > 0)
              ElevatedButton(
                onPressed: onPrevious,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Previous',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            const SizedBox(width: 16),
            if (currentIndex < totalChapters - 1)
              ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}




