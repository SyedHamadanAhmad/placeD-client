import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    // Check for authentication state when the widget is first created
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        this.user = user;
      });
    });
  }

  // Google Sign-In method
  Future<void> _signInWithGoogle() async {
    try {
      print("IN GOOGLE FUNCTION");
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      
      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the Google credential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Now you can access user details and print them
      User? user = userCredential.user;
      if (user != null) {
        print("User ID: ${user.uid}");
        print("User Name: ${user.displayName}");
        print("User Email: ${user.email}");
        print("User Photo URL: ${user.photoURL}");
      }
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

  // Sign out method
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: user == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Please sign in to view your profile'),
                  ElevatedButton(
                    onPressed: _signInWithGoogle,
                    child: const Text('Sign in with Google'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user!.photoURL ?? ''),
                  ),
                  const SizedBox(height: 16),
                  Text('Name: ${user!.displayName}'),
                  Text('Email: ${user!.email}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _signOut,
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
      ),
    );
  }
}
