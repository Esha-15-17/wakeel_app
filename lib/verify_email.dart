import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Constant.dart';
import 'signup_lawyer.dart';
import 'log_inScreen.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController otpController = TextEditingController();

  Future<void> verify(String otp) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.API_URL}/verify'),
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: jsonEncode({
          'code': otp,
        }),
      );

      if (response.statusCode == 200 ) {
        print('Email verification successful');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LogInScreen()),
        );

      } else {
        print('Email verification failed: ${response.body}');

      }
    } catch (e) {
      print('Error during verification: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 100,
              ),
              Text(
                'Verify Your Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Please enter the OTP code here...'),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                      hintText: 'Enter OTP...',
                      focusColor: Color(0xff01411C),
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Color(0xff01411C), width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Color(0xff01411C), width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  verify(otpController.text);
                },
                child: Container(
                  height: 50,
                  width: 122,
                  decoration: BoxDecoration(
                    color: Color(0xff01411C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Enter',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
