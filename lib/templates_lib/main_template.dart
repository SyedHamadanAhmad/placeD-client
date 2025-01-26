import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTemplate extends StatelessWidget {
  final String title;
  final Widget child;
  final int currentIndex;

  MainTemplate({
    required this.title,
    required this.child,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(title),
      body: SingleChildScrollView(child:child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  AppBar mainAppBar(String title) {
    return AppBar(
      backgroundColor: const Color(0xFF479539),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: title.substring(0, title.length - 1),
                ),
                TextSpan(
                  text: title.substring(title.length - 1),
                  style: const TextStyle(
                    color: Color(0xFF515151),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      leadingWidth: 300, // Adjust the width to accommodate the title
      title: const SizedBox.shrink(), // Hide the default title
      actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            print('Profile icon tapped');
          },
        ),
      ],
      toolbarHeight: 36, // Add the toolbarHeight property
    );
  }
}
