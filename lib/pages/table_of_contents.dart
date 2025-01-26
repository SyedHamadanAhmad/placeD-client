import 'dart:convert';
import 'package:flutter/material.dart';

class TableOfContents extends StatefulWidget {
  final String responseBody;

  const TableOfContents({required this.responseBody});

  @override
  _TableOfContentsState createState() => _TableOfContentsState();
}

class _TableOfContentsState extends State<TableOfContents> {
  List<String> contents = [];
  List<bool> checkedStatus = [];
  String courseName = ""; // Variable to store course name
  String course_image_url="gone";

  @override
  void initState() {
    super.initState();
    _parseResponseBody();
  }

  void _parseResponseBody() {
    final data = json.decode(widget.responseBody);
    courseName = data['course_name']; // Extract the course name
    course_image_url=data['course_image'];    
    // Convert contents to a mutable list
    final List<dynamic> rawContents = data['contents'];
    contents = List<String>.from(rawContents.map((content) => content.toString()));

    // Initialize checkedStatus as a mutable list
    checkedStatus = List<bool>.filled(contents.length, true, growable: true);
  }

  void _addNewContent(String newContent) {
    setState(() {
      print("Reached Add content function");
      print(course_image_url);
      contents.add(newContent);
      print("No problem with contents.add");
      print(checkedStatus);
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
                  print("Reached if block to add content");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName), // Display course name in the app bar
        actions: [
  Padding(
    padding: const EdgeInsets.only(right: 16.0), // Add padding to the Icon
    child: IconButton(
      icon: Icon(Icons.add),
      onPressed: _showAddContentDialog, // Trigger the dialog when "+" is pressed
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
              'Course: $courseName', // Display course name at the top
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
    );
  }
}
