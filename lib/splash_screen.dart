import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wakeel_app/Lawyer/Dashboard.dart';
import 'package:wakeel_app/legal_sevices.dart';
import 'package:wakeel_app/log_inScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Intro.dart';
import 'log_inScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool?> updateState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool repeat = prefs.getBool('repeat') ?? true;
    final bool isLogin = prefs.getBool('isLogin') ?? false;
    final bool isLawyer = prefs.getBool('isLawyer') ?? false;
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => repeat
                ? const IntroScreen()
                : (isLogin
                    ? (isLawyer ? const Dashboard(): const LegalServices())
                    : const LogInScreen()),
          ));
    });
  }

  @override
  void initState() {
    super.initState();
    updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff01411C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child:
                  Image.asset('assests/justice.png', height: 100, width: 150)),
          SizedBox(
            height: 20,
          ),
          Image.asset('assests/wakeel2_removebg_preview.png')
        ],
      ),
    );
  }
}
