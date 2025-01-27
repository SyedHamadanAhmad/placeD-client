import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class YoutubeLink {
  String title;
  String video_url;

  YoutubeLink(this.title, this.video_url);

  // Factory constructor to create a YoutubeLink from a map (response data)
  factory YoutubeLink.fromJson(Map<String, dynamic> json) {
    return YoutubeLink(
      json['title'] ?? '',
      json['video_url'] ?? '',
    );
  }
}

class Chapter {
  String topic_name;
  List<String> paragraphs;
  List<String> links;
  List<YoutubeLink> yt_links;

  Chapter({
    required this.topic_name,
    required this.paragraphs,
    required this.links,
    required this.yt_links,
  });

  // Factory constructor to create a Chapter from a map (response data)
  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      topic_name: json['topic_name'] ?? '',
      paragraphs: List<String>.from(json['paragraphs'] ?? []),
      links: List<String>.from(json['links'] ?? []),
      yt_links: (json['yt_links'] as List)
          .map((ytLinkJson) => YoutubeLink.fromJson(ytLinkJson))
          .toList(),
    );
  }
}

class CoursePage extends StatefulWidget {
  final String? courseId;
  final String? courseName;
  final String? courseImage;
  final List<Chapter> chapters;

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
  late PageController _pageController;
  late int _currentChapterIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentChapterIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentChapterIndex + 1) / widget.chapters.length;
    final primaryGreen = Color.fromARGB(255, 71, 149, 57);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryGreen,
        title: Text(
          'Course: ${widget.courseName}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Progress Bar with Notches
            Container(
              height: 40,
              child: Row(
                children: List.generate(
                  widget.chapters.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
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
                  ),
                ),
              ),
            ),

            Padding(
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
                itemBuilder: (context, index) {
                  Chapter chapter = widget.chapters[index];
                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chapter.topic_name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryGreen,
                            ),
                          ),
                          SizedBox(height: 20),
                          
                          ...chapter.paragraphs.map((paragraph) => Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              paragraph,
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.6,
                                color: Colors.black87,
                              ),
                            ),
                          )),

                          if (chapter.links.isNotEmpty) ...[
  SizedBox(height: 24),
  Text(
    'Related Resources',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: primaryGreen,
    ),
  ),
  SizedBox(height: 12),
  ...chapter.links.map((link) => Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () async {
            final Uri url = Uri.parse(link);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              // Handle error if the URL can't be launched
              print("Could not launch $link");
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
      )),
],


                          if (chapter.yt_links.isNotEmpty) ...[
                            SizedBox(height: 24),
                            Text(
                              'Video Resources',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: primaryGreen,
                              ),
                            ),
                            SizedBox(height: 12),
                            ...chapter.yt_links.map((ytLink) => Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                children: [
                                  Icon(Icons.play_circle_outline, 
                                    color: Colors.red),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      ytLink.title,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[700],
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_currentChapterIndex > 0)
                      ElevatedButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Previous',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    SizedBox(width: 16),
                    if (_currentChapterIndex < widget.chapters.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
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
            ),
          ],
        ),
      ),
    );
  }
}


