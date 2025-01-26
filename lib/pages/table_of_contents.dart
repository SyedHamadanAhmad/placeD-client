import 'package:flutter/material.dart';

class TableOfContents extends StatelessWidget {
  final String responseBody;
  const TableOfContents({required this.responseBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Response from API:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(responseBody), // Displaying the response body
          ],
        ),
      ),
    );
  }
}

