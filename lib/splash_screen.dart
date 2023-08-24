import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wakeel_app/log_inScreen.dart';

import 'log_inScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogInScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff01411C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assests/justice.png',
          height: 100,
          width: 150)

          ),
          SizedBox(
            height: 20,
          ),
          Image.asset('assests/wakeel2-removebg-preview.png')
        ],
      ),
    );
  }

}



