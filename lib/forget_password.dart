import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Constant.dart';
import 'log_inScreen.dart';
import 'reset_password.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({Key? key}) : super(key: key);

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  TextEditingController forgotController = TextEditingController();

  Future<void> forgot(String forgot) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.API_URL}/forgotpassword'),
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: jsonEncode({
          'email': forgot,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData['message']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => resetpassword()), // Navigate to OTPScreen
        );// Password reset code sent to your email
      } else if (response.statusCode == 400) {
        throw Exception('Recipient email not found');
      } else if (response.statusCode == 404) {
        throw Exception('User not found');
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      print('forgot password req failed: ${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)], // Dark green to light green
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assests/forgot.png'), // Replace with your logo
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Forget Your Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xff01411C),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Don\'t Worry, We Are Here to Help You.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: forgotController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email...',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      forgot(forgotController.text.toString());
                    },
                    child: Container(
                      height: 50,
                      width: 122,
                      decoration: BoxDecoration(
                        color: Color(0xFF01411C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}