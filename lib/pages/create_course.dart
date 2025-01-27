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
  String topic="";
  String? domain;

  bool _isLoading=false;
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
            greyBackgroundBoxWithSlider("How much depth would you like to learn at?"),
            SizedBox(height: 20),
            domainSelector(),
            SizedBox(height: 20),
            inputTopic(),
            SizedBox(height: 20),
            submitButton()
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
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
  Widget inputTopic(){
  return Container(
  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Outer spacing
  padding: EdgeInsets.all(15), // Inner spacing
  decoration: BoxDecoration(
    color: Colors.grey[200], // Light grey background
    borderRadius: BorderRadius.circular(10), // Rounded corners
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Please enter your preparation topic", // Title
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10), // Spacing between title and input
      TextField(
        onChanged: (value) {
          setState(() {
            topic=value;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter topic here", // Placeholder
        ),
      ),
    ],
  ),
);

}

Widget domainSelector(){
  return Container(
  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Outer spacing
  padding: EdgeInsets.all(15), // Inner spacing
  decoration: BoxDecoration(
    color: Colors.grey[200], // Light grey background
    borderRadius: BorderRadius.circular(10), // Rounded corners
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Select a domain", // Title
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10), // Spacing between title and dropdown
      DropdownButton<String>(
        value: domain, // The currently selected value
        hint: Text("Choose a domain"), // Placeholder text
        isExpanded: true, // Make dropdown expand to full width
        onChanged: (String? newValue) {
          setState(() {
            domain = newValue!; // Update the domain variable
          });
        },
        items: <String>[
          'Software Engineering - MAANG',
          'Software Engineering - Product Based Companies',
          'Software Engineering - Data Science & ML',
          'Non-core roles: Consulting',
          'Non-core roles: Product Management'
        ] // Dropdown options
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value), // Display each option
          );
        }).toList(),
      ),
    ],
  ),
);

}



Widget submitButton() {
 

  return ElevatedButton(
    onPressed: _isLoading ? null :  () async {

      setState(() {
        _isLoading=true;
        _errorMessage='';
      });
      print(level);
      print(sliderValue);
      print(domain);
      print(topic);
      try{
        await sendPostRequest();
      }
      catch(e){
        _errorMessage="An error has occurred. Please try again";
      }
      finally{
        setState(() {
          _isLoading=false;
        });
      }
      

    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255,71,149,57),

      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
    ),
    child:_isLoading?CircularProgressIndicator(color:Colors.white) : Text(
      'Submit',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    ),
  );
}
Future<void> sendPostRequest() async {
  // Define your API endpoint
  String toc_endpoint="http://127.0.0.1:8000/api/toc/";

  final url = Uri.parse(toc_endpoint); // Replace with your actual API URL

  // Create a map of data to send in the request body
  final data = {
    'topic':topic,
    'level':level,
    'area':domain,
    'depth':sliderValue
  };

  
  // Send the POST request
  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: json.encode(data), // Convert data map to JSON
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, print success
      print('Request successful: ${response.body}');
       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TableOfContents(responseBody: response.body, level: level, sliderValue: sliderValue, domain: domain),
        ),
      );
      
    } else {
      // If the server returns an error code, print the error
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending POST request: $e');
  }

}

}

