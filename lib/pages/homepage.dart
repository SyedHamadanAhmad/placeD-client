import 'package:flutter/material.dart';
import '../templates_lib/main_template.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainTemplate(
      title: 'PlaceD',
      currentIndex: 0,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createCourse');
          },
          child: Text('Go to Create Course Page'),
        ),
      ),
    );
  }
}
