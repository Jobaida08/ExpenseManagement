// Import necessary packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/main.dart';

// Define AuthPage widget
class AuthPage extends StatelessWidget {
  // Declare text editing controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to sign up a user
  Future<void> signUp(BuildContext context) async {
    try {
      // Create a user account using Firebase Authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Navigate to the main page after successful sign-up
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      // Handle sign-up errors
      print('Sign-up error: $e');
      // You can display an error message to the user here if needed
    }
  }

  // Function to sign in a user
  Future<void> signIn(BuildContext context) async {
    try {
      // Sign in the user using Firebase Authentication
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Navigate to the main page after successful sign-in
      // Navigator.pushReplacementNamed(context, '/main');
      Navigator.push(context, MaterialPageRoute(builder: (c) => MyHomePage()));
    } catch (e) {
      // Handle sign-in errors
      print('Sign-in error: $e');
      // You can display an error message to the user here if needed
    }
  }

  // Build method for building the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up / Sign In'),automaticallyImplyLeading: false),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text field for entering email
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // Text field for entering password
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Hide password text
            ),
            SizedBox(height: 16.0),
            // Button for signing up
            ElevatedButton(
              onPressed: () => signUp(context),
              child: Text('Sign Up'),
            ),
            // Button for signing in
            ElevatedButton(
              onPressed: () => signIn(context),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
