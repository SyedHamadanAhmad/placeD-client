import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placed_client/pages/course_page.dart';
import 'dart:math';

class TableOfContents extends StatefulWidget {
  final String responseBody;
  final String level;
  final String? domain;
  final double sliderValue;

  const TableOfContents({
    required this.responseBody,
    required this.level,
    required this.domain,
    required this.sliderValue,
  });

  @override
  _TableOfContentsState createState() => _TableOfContentsState();
}

class _TableOfContentsState extends State<TableOfContents> {
  List<String> contents = [];
  List<bool> checkedStatus = [];
  String courseName = ""; // Variable to store course name
  String course_image_url = "";
  String course_id = "";
  bool _isLoading = false; // Track loading state

  @override
  void initState() {
    super.initState();
    _parseResponseBody();
  }

  String generateCourseId() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();

    // Generate a random alphanumeric string of the specified length
    String courseId = List.generate(16, (index) {
      return characters[random.nextInt(characters.length)];
    }).join();

    return courseId;
  }

  void _parseResponseBody() {
    final data = json.decode(widget.responseBody);
    courseName = data['course_name']; // Extract the course name
    course_image_url = data['course_image'];
    // Convert contents to a mutable list
    final List<dynamic> rawContents = data['contents'];
    contents = List<String>.from(rawContents.map((content) => content.toString()));
    course_id = generateCourseId();
    print("COURSE ID GENERATED: ${course_id}");
    // Initialize checkedStatus as a mutable list
    checkedStatus = List<bool>.filled(contents.length, true, growable: true);
  }

  void _addNewContent(String newContent) {
    setState(() {
      contents.add(newContent);
      checkedStatus.add(true);
    });
  }

  void _showAddContentDialog() {
    String newContent = "";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Content'),
          content: TextField(
            onChanged: (value) {
              newContent = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter content title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newContent.isNotEmpty) {
                  _addNewContent(newContent);
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  List<String> getSelectedContents() {
    List<String> selected = [];
    for (int i = 0; i < contents.length; i++) {
      if (checkedStatus[i]) {
        selected.add(contents[i]);
      }
    }
    return selected;
  }

  // Function to send POST request
  Future<void> _sendPostRequest() async {
    setState(() {
      _isLoading = true; // Set loading state to true
    });

    final url = 'http://3.108.31.127/generate-course/'; // Replace with your API endpoint

    // Create a payload with selected contents
    List<String> selectedContents = getSelectedContents();

    // Example payload to send (adjust as needed)
    final Map<String, dynamic> data = {
      'topic': courseName,
      'level': widget.level,  // Use widget.level to access the level
      'area': widget.domain,  // Use widget.domain to access the domain
      'depth': widget.sliderValue,  // Use widget.sliderValue to access the slider value
      'contents': selectedContents,  // Contents that are selected
    };

    // Send POST request
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        // Handle success
        print('POST request successful');
        final List<dynamic> jsonData = jsonDecode(response.body);
        List<Chapter> chapters = jsonData
            .map((chapterJson) => Chapter.fromJson(chapterJson as Map<String, dynamic>))
            .toList();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursePage(
              courseId: course_id,
              courseImage: course_image_url,
              courseName: courseName,
              chapters: chapters,
            ),
          ),
        );
      } else {
        // Handle error
        print('POST request failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending POST request: $e');
    } finally {
      setState(() {
        _isLoading = false; // Set loading state to false when request is done
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: _showAddContentDialog,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course: $courseName',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Table of Contents:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(contents[index]),
                    value: checkedStatus[index],
                    onChanged: (bool? value) {
                      setState(() {
                        checkedStatus[index] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _sendPostRequest, // Disable button while loading
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Icon(Icons.arrow_forward),
        tooltip: 'Send Request',
      ),
    );
  }
}
