import 'package:flutter/material.dart';
import 'package:placed_client/templates_lib/main_template.dart';

class CreateCourse extends StatefulWidget {
  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  String level = ''; // To store the selected level for buttons
  double sliderValue = 0; // To store the slider value
  String sliderLevel = 'Beginner'; // To store the slider-selected level

  @override
  Widget build(BuildContext context) {
    return MainTemplate(
      title: 'PlaceD',
      currentIndex: 0,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'First, let\'s get to know you', // Big text
              style: TextStyle(
                fontSize: 32, // Large font size
                fontWeight: FontWeight.bold, // Bold style
              ),
            ),
            SizedBox(height: 8), // Space between the texts
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                'Fill out a few prompts to help us curate the best course for you.', // Smaller grey text
                style: TextStyle(
                  fontSize: 16, // Smaller font size
                  color: Colors.grey, // Grey color for the text
                ),
                textAlign: TextAlign.center, // Center-align the smaller text
              ),
            ),
            SizedBox(height: 20),
            greyBackgroundBoxWithButtons("What level would you like to learn at?"),
            SizedBox(height: 20),
            greyBackgroundBoxWithSlider("Choose your experience level"),
          ],
        ),
      ),
    );
  }

  /// Grey box with buttons
  Widget greyBackgroundBoxWithButtons(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Outer spacing
      padding: EdgeInsets.all(15), // Inner spacing
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20, // Large font size
              fontWeight: FontWeight.bold, // Bold style
            ),
            textAlign: TextAlign.center, // Center the text within the box
          ),
          SizedBox(height: 15), // Space between the text and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              levelButton('Beginner'),
              levelButton('Intermediate'),
              levelButton('Expert'),
            ],
          ),
        ],
      ),
    );
  }

  /// Grey box with slider
  Widget greyBackgroundBoxWithSlider(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Outer spacing
      padding: EdgeInsets.all(15), // Inner spacing
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20, // Large font size
              fontWeight: FontWeight.bold, // Bold style
            ),
            textAlign: TextAlign.center, // Center the text within the box
          ),
          SizedBox(height: 15), // Space between the text and slider
          Text(
            sliderLevel, // Display the level based on the slider value
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255,71,149,57),
            ),
          ),
          Slider(
            value: sliderValue,
            min: 0,
            max: 100,
            divisions: 100,
            label: sliderValue.round().toString(),
            activeColor: Color.fromARGB(255,71,149,57),
            onChanged: (value) {
              setState(() {
                sliderValue = value;
                if (sliderValue <= 30) {
                  sliderLevel = 'Beginner';
                } else if (sliderValue <= 75) {
                  sliderLevel = 'Intermediate';
                } else {
                  sliderLevel = 'Expert';
                }
              });
            },
          ),
        ],
      ),
    );
  }

  /// Method to create individual buttons
  Widget levelButton(String text) {
    bool isSelected = level == text; // Check if this button is selected
    return GestureDetector(
      onTap: () {
        setState(() {
          level = text; // Update the selected level
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255,71,149,57) : Colors.white, // Highlight if selected
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Color.fromARGB(255,71,149,57) : Colors.grey, // Change border color
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black, // Change text color
          ),
        ),
      ),
    );
  }
}
