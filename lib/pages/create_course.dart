import 'package:flutter/material.dart';
import 'package:placed_client/templates_lib/main_template.dart';

class CreateCourse extends StatelessWidget {
  const CreateCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTemplate(
      title: 'PlaceD',
      currentIndex: 1,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'First, lets get to know you', // Big text
              style: TextStyle(
                fontSize: 32, // Large font size
                fontWeight: FontWeight.bold, // Bold style
              ),
            ),
            SizedBox(height: 8), // Space between the texts
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: (Text(
                'Fill out a few prompts to help us curate the best course for you.', // Smaller grey text
                style: TextStyle(
                  fontSize: 16, // Smaller font size
                  color: Colors.grey, // Grey color for the text
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
