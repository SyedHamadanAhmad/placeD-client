import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placed_client/templates_lib/main_template.dart';

class ResumeQuesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainTemplate(
      title: 'PlaceD',
      currentIndex: 2, // Ensure Resume Page is highlighted in navbar
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding for spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main heading
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "Upload your resume here"),
                  ],
                ),
              ),
              SizedBox(height: 8),

              // "Here’s how it works" in red
              Text(
                "Here’s how it works",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 245, 83, 14), // Red color
                ),
              ),
              SizedBox(height: 4),

              // Description in black
              Text(
                "We scan through your resume just like any other interviewer would, and we’ll list out some key questions to simulate a real-time interview experience, giving you an idea of what you can expect!",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),

              // Combined Add Resume Box with Plus Icon
              GestureDetector(
                onTap: () {
                  // Implement functionality for the "+" button
                  print("Add resume tapped");
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFF479539)), // Border color
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white, // Background color
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add latest Resume',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 100),
                      Icon(Icons.add, color: const Color(0xFF479539)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Let's start section
              Text(
                "Let's start!",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),

              // Questions list
              buildQuestion("Question 1",
                  "Why did you use FireBase in your project? What’s so special about it"),
              SizedBox(height: 12),
              buildQuestion("Question 2",
                  "Why did you use FireBase in your project? What’s so special about it"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuestion(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300, // background color
            borderRadius: BorderRadius.circular(12), // rounded corners
          ),
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "View answer",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(
                    16.0), // Add padding inside the expanded area
                child: Text(
                  "This is the answer to the question. Here's where the explanation goes.",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
