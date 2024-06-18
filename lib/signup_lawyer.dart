import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wakeel_app/signup_lawyer.dart';
import 'log_inScreen.dart';
import 'client_lawyer.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'profile_screen.dart';
import 'log_inScreen.dart';
import 'legal_sevices.dart';
import 'Constant.dart';
import 'verify_email.dart';
import 'dart:collection';

class signuplawyer extends StatefulWidget {
  const signuplawyer({Key? key, required String userRole}) : super(key: key);

  @override
  State<signuplawyer> createState() => _signuplawyerState();
}

class _signuplawyerState extends State<signuplawyer> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  String _selectedUserRole = 'user'; // Default selected role

  bool _showProgress = false;

  Future<void> registerUser(
      String name,
      String email,
      String phone,
      String password,
      String confirmPassword,
      String userRole,
      ) async {
    setState(() {
      _showProgress = true;
    });

    try {
      final response = await http.post(
        Uri.parse('${Constants.API_URL}/register'),
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
        body: jsonEncode({
          'role': userRole,
          'name': name,
          'email': email,
          'phone_number': phone,
          'password': password,
          'confirmPassword': confirmPassword,
        }),
      );

      if (response.statusCode == 201) {
        print('Registration successful');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerifyEmail()),
        );
      } else {
        print('Registration failed: ${response.body}');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _showProgress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: _showProgress,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30, width: 100),
                Text(
                  'Let\'s Get Started',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 10),
                Text('Please sign up before getting started.'),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: nameController,
                      style: const TextStyle(color: Color(0xff01411C)),
                      decoration: InputDecoration(
                        hintText: 'Name',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: Color(0xff01411C), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: const Color(0xff01411C), width: 2.0),
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
                      controller: emailController,
                      style: TextStyle(color: Color(0xff01411C)),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: Color(0xff01411C), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: const Color(0xff01411C), width: 2.0),
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
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Color(0xff01411C)),
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: Color(0xff01411C), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: const Color(0xff01411C), width: 2.0),
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
                      obscureText: _obscureText,
                      controller: passwordController,
                      style: TextStyle(color: Color(0xff01411C)),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
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
                          borderSide:
                          BorderSide(color: Color(0xff01411C), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: const Color(0xff01411C), width: 2.0),
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
                      obscureText: _obscureText,
                      controller: confirmpasswordController,
                      style: TextStyle(color: Color(0xff01411C)),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: 'Confirm Password',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: Color(0xff01411C), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                          BorderSide(color: const Color(0xff01411C), width: 2.0),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff01411C),
                      width: 2,
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.white, Color(0xff01411C).withOpacity(0.2)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'How would you like to role yourself:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color:Colors.grey,
                                ),
                                Expanded(
                                  child: DropdownButton<String>(
                                    value: _selectedUserRole,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedUserRole = newValue!;
                                      });
                                    },
                                    items: <String>['user', 'lawyer'] // Add more roles if needed
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff01411C),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Other text fields...

                      // User role selection dropdown
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    registerUser(
                      nameController.text.toString(),
                      emailController.text.toString(),
                      phoneController.text.toString(),
                      passwordController.text.toString(),
                      confirmpasswordController.text.toString(),
                      _selectedUserRole,
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
                        'Create Account',
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
    );
  }  }

