import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Constant.dart';
import 'dart:convert';
class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController issueController = TextEditingController();


  Future<void> sendMessage(String subject, String issue) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      final response = await http.post(
        Uri.parse('${Constants.API_URL}/contact-us'),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'subject': subject,
          'message': issue,
        }),
      );

      if (response.statusCode == 200) {
        print('Message sent successfully');
      } else {
        print(' failed: ${response.body}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Contact Us', style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xff01411C)
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    labelStyle: TextStyle(color: Color(0xff01411C)),
                    // Green label text color
                    focusColor: Color(0xff01411C),
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Color(0xff01411C), width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: const Color(0xff01411C), width: 2.0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: issueController,
                  maxLines: 15,
                  decoration: InputDecoration(
                    labelText: 'Issue',
                    labelStyle: TextStyle(color: Color(0xff01411C)),
                    // Green label text color
                    focusColor: Color(0xff01411C),
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Color(0xff01411C), width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: const Color(0xff01411C), width: 2.0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    sendMessage(
                      subjectController.text,
                      issueController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff01411C), // Button background color
                  ),
                  child: Text(
                    'Send Message',
                    style: TextStyle(color: Colors.white), // Button text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






