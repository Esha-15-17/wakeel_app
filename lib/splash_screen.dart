import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wakeel_app/Lawyer/Dashboard.dart';
import 'package:wakeel_app/legal_sevices.dart';
import 'package:wakeel_app/log_inScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Intro.dart';
import 'log_inScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

<<<<<<< Updated upstream
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
=======
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
>>>>>>> Stashed changes

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigation after animation is completed
        updateState();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool?> updateState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool repeat = prefs.getBool('repeat') ?? true;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => repeat ? const IntroScreen() : const LogInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
<<<<<<< Updated upstream
          Center(
              child:
                  Image.asset('assests/justice.png', height: 100, width: 150)),
          SizedBox(
            height: 20,
          ),
          Image.asset('assests/wakeel2_removebg_preview.png')
=======
          // Background with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF01411C), // Dark green
                  Color(0xFF0E5227), // Medium green
                  Color(0xFF137E41), // Light green
                ],
              ),
            ),
          ),
          // Content centered in the stack
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      'assests/jh.png',
                      height: 200,
                      width: 250,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
>>>>>>> Stashed changes
        ],
      ),
    );
  }
}
