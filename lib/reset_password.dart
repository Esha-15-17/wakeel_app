import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'log_inScreen.dart';
import 'Constant.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  TextEditingController resetController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  Future<void> resetPassword(String reset, String password, String confirmpassword) async {
    try {
      if (password != confirmpassword) {
        throw Exception('Passwords do not match');
      }

      final Map<String, dynamic> requestBody = {
        'resetCode': reset,
        'newPassword': password,
        'confirmNewPassword': confirmpassword,
      };

      final response = await http.post(
        Uri.parse('${Constants.API_URL}/reset-password'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData['message']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LogInScreen()),
        ); // Navigate to LogInScreen
      } else if (response.statusCode == 400) {
        throw Exception('Passwords do not match');
      } else if (response.statusCode == 404) {
        throw Exception('Invalid or expired reset code');
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      String errorMessage = 'Password reset failed: $e';
      if (e is Exception) {
        errorMessage = e.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
        ),
      );
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
                'Reset your password?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Dont Worry, we are here to help you.'),
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
                    controller: resetController,
                    style: const TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                      hintText: 'Reset code',
                      focusColor: Color(0xff01411C),
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color(0xff01411C),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: const Color(0xff01411C),
                          width: 2.0,
                        ),
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
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: passwordController,
                    style: const TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                      hintText: 'New password',
                      focusColor: Color(0xff01411C),
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color(0xff01411C),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: const Color(0xff01411C),
                          width: 2.0,
                        ),
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
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: confirmpasswordController,
                    style: const TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      focusColor: Color(0xff01411C),
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color(0xff01411C),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: const Color(0xff01411C),
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              // ... (similar code for other TextFields)
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  resetPassword(
                    resetController.text.toString(),
                    passwordController.text.toString(),
                    confirmpasswordController.text.toString(),
                  );
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
    );
  }
}
