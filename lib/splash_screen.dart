import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wakeel_app/Lawyer/Dashboard.dart';
import 'package:wakeel_app/admin/admindashboard.dart';
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
    String userRole = prefs.getString('role') ?? 'admin';
    bool isLawyer = false;
    bool admin = false;
    if (userRole == "lawyer") {
      isLawyer = true;
    } else if (userRole == "admin") {
      admin = true;
    }

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => repeat
                ? const IntroScreen()
                : (isLogin
                    ? (isLawyer
                        ? const Dashboard()
                        : admin
                            ? AdminDashboard()
                            : const LegalServices())
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
          Center(child: Image.asset('assests/jh.png', height: 200, width: 250)),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
