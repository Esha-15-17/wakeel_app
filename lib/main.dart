import 'package:flutter/material.dart';
import 'package:wakeel_app/Lawyer/Dashboard.dart';
import 'package:wakeel_app/splash_screen.dart';
import 'chatwidget.dart';
import 'legal_sevices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(useMaterial3: true),
        home:  SplashScreen() );//SplashScreen());
        // home:  legalservices() );//SplashScreen());
  }
}
