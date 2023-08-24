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
    return  SafeArea(
        child:Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(
        height: 30,
        width: 100,
    ),
    Text (
    'Forget your password?',
    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25 ),
    ),
    SizedBox(
    height: 10,
    ),
    Text('Dont Worry,we are here to help you.'),
    SizedBox(
    height: 30,
    ),
          SizedBox(
            height: 20,
          ),
    Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: SizedBox(
    height: 40,
    child: TextField(
      controller:forgotController,
    style: const TextStyle(color: Color(0xff01411C)),
    decoration: InputDecoration(
    hintText: 'Enter your email..',
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
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              forgot(forgotController.text.toString());
            },
            child:
    Container(
    height: 50,
    width: 122,
    decoration: BoxDecoration(
    color: Color(0xff01411C),
    borderRadius: BorderRadius.circular(20)),
    child: Center(
    child: Text(
    'Reset',
    style: TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold),
    )),
    ),
          ),
        ],
        ),
        ),

        )
    );
  }
}