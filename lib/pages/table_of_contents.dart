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

  @override
  void initState() {
    super.initState();
    _parseResponseBody();
  }

  void _parseResponseBody() {
    final data = json.decode(widget.responseBody);
    courseName = data['course_name']; // Extract the course name
    final List<dynamic> rawContents = data['contents'];
    contents = rawContents.map((content) => content.toString()).toList();
    checkedStatus = List<bool>.filled(contents.length, true);
  }

  void _addNewContent(String newContent) {
    setState(() {
      contents.add(newContent);
      checkedStatus.add(true); // Default to checked when added
    });
  }

  void _showAddContentDialog() {
  final TextEditingController textController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add New Content'),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: 'Enter content name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newContent = textController.text.trim();
              if (newContent.isNotEmpty) {
                _addNewContent(newContent);
                Navigator.of(context).pop();
              }
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
      title: Text(courseName),
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
  );
}
}
