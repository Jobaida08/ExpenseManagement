import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/AuthPage.dart';
import 'package:untitled1/main.dart';

import '../global/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 1), () async {
      if(firebaseAuth.currentUser != null){
        //Home Screen
        Navigator.push(context, MaterialPageRoute(builder: (c) => MyHomePage()));
      }
      else {
        //Login Screen
        Navigator.push(context, MaterialPageRoute(builder: (c) => AuthPage()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show toast when the back button is pressed
        Fluttertoast.showToast(
          msg: "Closing the app",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        // Wait for 1 seconds to check if the user presses back again
        await Future.delayed(Duration(seconds: 1));

        // If back is pressed again within 1 seconds, close the app
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset("images/logo.jpg", scale: 2,),

                Image.asset("assets/images/waiting.png"),

                // Text("Supper Go",
                //   style: TextStyle(
                //     fontSize: 30,
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
