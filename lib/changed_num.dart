import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constant.dart';
import 'menu.dart';

class changednum extends StatefulWidget {
  const changednum({Key? key}) : super(key: key);

  @override
  State<changednum> createState() => _changednumState();
}

class _changednumState extends State<changednum> {
  TextEditingController numController = TextEditingController();

  Future<void> verify(String num) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      final response = await http.post(
        Uri.parse('${Constants.API_URL}/change-phone-number'),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'newPhoneNumber': num,

        }),
      );
      if (response.statusCode == 200) {
        print('update successful');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Menu()),
        );
      } else {
        print('update failed: ${response.body}');
      }
    } catch (e) {
      print('Error during update: ${e.toString()}');
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
                'Change your number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Connect with us by adding your number ...'),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: numController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                      hintText: 'Enter 0300...',
                      focusColor: Color(0xff01411C),
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Color(0xff01411C),
                            width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Color(0xff01411C),
                            width: 2.0),
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
                  verify(numController.text);
                },
                child: Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Color(0xff01411C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Changed Number',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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