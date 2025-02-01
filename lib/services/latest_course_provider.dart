import 'package:flutter/material.dart';

class LatestCourseProvider extends ChangeNotifier {
  String? _latestCourse;

  String? get latestCourse => _latestCourse;

  /// Updates the latest accessed course ID and notifies listeners.
  void setLatestCourseId(String courseId) {
    _latestCourse = courseId;
    notifyListeners();
  }
}
