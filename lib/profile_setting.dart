// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/MessaeHistory.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'My_profile.dart';
import 'my_booking.dart';
import 'schedule.dart';
import 'menu.dart';
import 'chatwidget.dart';
import 'appointment.dart';
import 'LEGAL.dart';
import 'find_lawyer.dart';
import 'lawyer_profile.dart';
import 'notfications_screen.dart';

class profilesetting extends StatefulWidget {
  const profilesetting({super.key});

  @override
  State<profilesetting> createState() => _profilesettingState();
}

class _profilesettingState extends State<profilesetting> {


  // This widget is the root of your application.
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: WakeelAppBar(back: false),
          ),
          body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      style: TextStyle(color: Color(0xff01411C)),
                      decoration: InputDecoration(
                        hintText: 'Search for a setting',
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
                        // Add the search icon to the suffixIcon property
                        suffixIcon: Icon(
                          Icons.search,
                          color: Color(0xff01411C),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => myprofile()));
                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.person),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.note_sharp),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Appearance',
                          style: TextStyle(fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Icon(Icons.privacy_tip_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 15,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.help_center_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Help and Support',
                          style: TextStyle(fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.person_pin),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'About',
                          style: TextStyle(fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatScreen()));
                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.message_rounded),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Messages',
                          style: TextStyle(fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ]),
              ],
              )
          ),
        ));
  }
}
