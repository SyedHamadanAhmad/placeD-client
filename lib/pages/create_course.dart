import 'package:flutter/material.dart';
import 'package:placed_client/templates_lib/main_template.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'table_of_contents.dart';

class CreateCourse extends StatefulWidget {
  const CreateCourse({super.key});

  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  String level = '';
  double sliderValue = 0;
  String sliderLevel = 'Beginner';
  String topic = "";
  String? domain;

  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return MainTemplate(
      title: 'PlaceD',
      currentIndex: 0,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 8),
            // Shifted text to left by using a Container with full width and left alignment
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'First, let\'s get to know you',
                style: TextStyle(
                  fontSize: 24 * textScaleFactor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Fill out a few prompts to help us curate the best course for you.',
                style: TextStyle(
                  fontSize: 16 * textScaleFactor,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20),
            // First Question Box: Level (with description inside)
            greyBackgroundBoxWithButtons(
              "What level would you like to learn at?",
              "Choose a level that best matches your current expertise in your domain. This helps us tailor the content to your needs.",
            ),
            SizedBox(height: 20),
            // Second Question Box: Depth (with description inside)
            greyBackgroundBoxWithSlider(
              "How much depth would you like to learn at?",
              "Select the level of detail you'd like your course to be at. A higher depth means a more comprehensive exploration of the topic with more chapters",
            ),
            SizedBox(height: 20),
            domainSelector(),
            SizedBox(height: 20),
            inputTopic(),
            SizedBox(height: 15),
            submitButton()
          ],
        ),
      ),
    );
  }

  /// Grey box with buttons, a header, and a description paragraph.
  Widget greyBackgroundBoxWithButtons(String heading, String description) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align left for description
        children: [
          Center(
            child: Text(
              heading,
              style: TextStyle(
                fontSize: 18 * textScaleFactor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 14 * textScaleFactor, // Smaller than header
              color: Colors.black87,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 15),
          // Use Expanded for equal sized buttons
          Row(
            children: [
              Expanded(child: levelButton('Beginner')),
              SizedBox(width: 10),
              Expanded(child: levelButton('Intermediate')),
              SizedBox(width: 10),
              Expanded(child: levelButton('Expert')),
            ],
          ),
        ],
      ),
    );
  }

  /// Grey box with slider, a header, and a description paragraph.
  Widget greyBackgroundBoxWithSlider(String heading, String description) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align left for description
        children: [
          Center(
            child: Text(
              heading,
              style: TextStyle(
                fontSize: 18 * textScaleFactor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 14 * textScaleFactor, // Smaller font than header
              color: Colors.black87,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              sliderLevel,
              style: TextStyle(
                fontSize: 18 * textScaleFactor,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 71, 149, 57),
              ),
            ),
          ),
          Slider(
            value: sliderValue,
            min: 0,
            max: 100,
            divisions: 100,
            label: sliderValue.round().toString(),
            activeColor: Color.fromARGB(255, 71, 149, 57),
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

  Widget levelButton(String text) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    bool isSelected = level == text;
    // Adjust the font size based on the text (smaller for longer text)
    double fontSize;
    if (text == 'Expert') {
      fontSize = 14;
    } else if (text == 'Intermediate') {
      fontSize = 9;
    } else {
      fontSize = 13.5;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          level = text;
        });
      },
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 40),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(255, 71, 149, 57) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Color.fromARGB(255, 71, 149, 57) : Colors.grey,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize * textScaleFactor,
            color: isSelected ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget inputTopic() {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Please enter your preparation topic",
            style: TextStyle(
              fontSize: 18 * textScaleFactor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              setState(() {
                topic = value;
              });
            },
            style: TextStyle(fontSize: 16 * textScaleFactor),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter topic here",
              hintStyle: TextStyle(fontSize: 16 * textScaleFactor),
            ),
          ),
        ],
      ),
    );
  }

  Widget domainSelector() {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select a domain",
            style: TextStyle(
              fontSize: 18 * textScaleFactor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            value: domain,
            hint: Text(
              "Choose a domain",
              style: TextStyle(fontSize: 16 * textScaleFactor),
            ),
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                domain = newValue!;
              });
            },
            style: TextStyle(
              fontSize: 16 * textScaleFactor,
              color: Colors.black,
            ),
            items: <String>[
              'Software Engineering - MAANG',
              'Software Engineering - Product Based Companies',
              'Software Engineering - Data Science & ML',
              'Non-core roles: Consulting',
              'Non-core roles: Product Management'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              setState(() {
                _isLoading = true;
                _errorMessage = '';
              });
              try {
                await sendPostRequest();
              } catch (e) {
                _errorMessage = "An error has occurred. Please try again";
              } finally {
                setState(() {
                  _isLoading = false;
                });
              }
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 71, 149, 57),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: _isLoading
          ? CircularProgressIndicator(color: Colors.white)
          : Text(
              'Submit',
              style: TextStyle(
                fontSize: 16 * textScaleFactor,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }

  Future<void> sendPostRequest() async {
    String tocEndpoint = "http://3.109.123.153/toc/";
    final url = Uri.parse(tocEndpoint);
    final data = {
      'topic': topic,
      'level': level,
      'area': domain,
      'depth': sliderValue
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TableOfContents(
              responseBody: response.body,
              level: level,
              sliderValue: sliderValue,
              domain: domain,
            ),
          ),
        );
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending POST request: $e');
    }
  }
}
