import 'package:flutter/material.dart';
import 'package:placed_client/templates_lib/main_template.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'table_of_contents.dart';

class CreateCourse extends StatefulWidget {
  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  String level = ''; // To store the selected level for buttons
  double sliderValue = 0; // To store the slider value
  String sliderLevel = 'Beginner'; // To store the slider-selected level
  String topic = "";
  String? domain;

  bool _isLoading = false;
  String? _errorMessage;

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
                fontSize: MediaQuery.of(context).size.width *
                    0.075, // Scales with screen width
                fontWeight: FontWeight.bold, // Bold style
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                'Fill out a few prompts to help us curate the best course for you.', // Smaller grey text
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width *
                      0.04, // Dynamic font size
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            greyBackgroundBoxWithButtons(
                "What level would you like to learn at?"),
            SizedBox(height: 20),
            greyBackgroundBoxWithSlider(
                "How much depth would you like to learn at?"),
            SizedBox(height: 20),
            domainSelector(),
            SizedBox(height: 20),
            inputTopic(),
            SizedBox(height: 15), // Reduced the space before the submit button
            submitButton()
          ],
        ),
      ),
    );
  }

  /// Grey box with buttons
  Widget greyBackgroundBoxWithButtons(String text) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.05),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Using Flexible to make all buttons have equal width
              Flexible(child: levelButton('Beginner')),
              Flexible(child: levelButton('Intermediate')),
              Flexible(child: levelButton('Expert')),
            ],
          ),
        ],
      ),
    );
  }

  /// Grey box with slider
  Widget greyBackgroundBoxWithSlider(String text) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.05),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            sliderLevel, // Display the level based on the slider value
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 71, 149, 57),
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
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 71, 149, 57)
              : Colors.white, // Highlight if selected
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? Color.fromARGB(255, 71, 149, 57)
                : Colors.grey, // Change border color
            width: 2,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown, // Scales down the text to fit
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16, // Default font size
              color:
                  isSelected ? Colors.white : Colors.black, // Change text color
            ),
            textAlign: TextAlign.center, // Center the text horizontally
          ),
        ),
      ),
    );
  }

  Widget inputTopic() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.05),
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
              fontSize: MediaQuery.of(context).size.width * 0.05,
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
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter topic here",
            ),
          ),
        ],
      ),
    );
  }

  Widget domainSelector() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.05),
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
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            value: domain,
            hint: Text("Choose a domain"),
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                domain = newValue!;
              });
            },
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
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              setState(() {
                _isLoading = true;
                _errorMessage = '';
              });
              print(level);
              print(sliderValue);
              print(domain);
              print(topic);
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
    );
  }

  Future<void> sendPostRequest() async {
    String toc_endpoint = "http://127.0.0.1:8000/api/toc/";
    final url = Uri.parse(toc_endpoint);
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
