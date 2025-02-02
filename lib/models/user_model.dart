import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  // Method to set user data
  void setUser(User? user) {
    _user = user;
    notifyListeners(); // Notify listeners of changes
  }

  // Method to clear user data
  void clearUser() {
    _user = null;
    notifyListeners(); // Notify listeners of changes
  }
   Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setUser(null); // Reset user state
  }
}
