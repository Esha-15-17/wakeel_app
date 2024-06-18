// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wakeel_app/Lawyer/Dashboard.dart';

import 'legal_sevices.dart';
import 'signup_lawyer.dart';
import 'client_lawyer.dart';
import 'forget_password.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'Constant.dart';
import 'forget_password.dart';
import 'reset_password.dart';
import 'lawyer_profile.dart';
import 'verify_email.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {



  bool _obscureText = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String _token = "";


  void loginn (String email, password) async {
    try {
      // final response = await http.post(Uri.parse('http://127.0.0.1:3000/login'),
      final response = await http.post(Uri.parse('${Constants.API_URL}/login'),
          headers: <String, String>{
            'Content-Type': 'application/json;charSet=UTF-8',
            'Accept': '*/*'
          },
          body: jsonEncode({
            'email': email,
            'password': password,
          })
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        _token = responseData['token'].toString();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", _token);
        print('Login successful');
        if (responseData.containsKey('userRole')) {
          String userRole = responseData['userRole'];
          if (userRole == 'lawyer') {
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => lawyerprofile(userRole: 'lawyer'),
                builder: (context) => Dashboard(),
              ),
            );
          } else if (userRole == 'user') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => legalservices(),
              ),
            );
          }
        } else {
          print('User role not found in response data.');
        }
      } else {
        print('Failed: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color(0xff01411C),
              content: Text('Invalid credentials.'),
            )
            );
      }

      } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xff01411C),
          content: Text('Login failed. Please check your credentials.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    emailController.text = "adilmalik147@gmail.com";
    passwordController.text = "1234";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    height: 150,
                    width: 300,
                    child: Center(child: Image.asset('assests/tarazo.png'))),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Welcome!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text('We are happy to see you here'),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        hintText: 'Enter Email',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Color(0xff01411C), width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: const Color(0xff01411C), width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    obscureText: _obscureText,
                    controller: passwordController,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: 'Password',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Color(0xff01411C))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: const Color(0xff01411C), width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: Colors.black, width: 2.0),
                        )),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 250),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => forgetpassword(),
                          ));
                    },
                    child: Text('Forgot Password?'),
                  )),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  loginn(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Container(
                  height: 35,
                  width: 122,
                  decoration: BoxDecoration(
                      color: Color(0xff01411C),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(color: Color(0xFF797979)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signuplawyer(userRole:'client'),
                          ));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff01411C)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
