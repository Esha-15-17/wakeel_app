// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/appointment.dart';
import 'package:wakeel_app/profile_screen.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'appointmentList.dart';
import 'booking.dart';
import 'chatwidget.dart';
import 'my_booking.dart';
import 'legal_sevices.dart';
import 'find_lawyer.dart';
import 'LEGAL.dart';
import 'notfications_screen.dart';
import 'menu.dart';
import 'package:wakeel_app/My_profile.dart';

class appointment extends StatefulWidget {
  const appointment({super.key});

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  int _currentIndex = 0;

  // This widget is the root of your application.
  Widget appointment() {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: WakeelAppBar(back: true),
          ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookEmergency()));
                  },
                  child: Column(
                    children: [
                      Image.asset('assests/book.png', height: 70, width: 50),
                      //height: 50, width: 30),
                      Text('Emergency\nBook'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => legalser()));
                  },
                  child: Column(
                    children: [
                      Image.asset('assests/ls.png', height: 70, width: 50),
                      Text('Legal\nService'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => findlawyer()));
                  },
                  child: Column(
                    children: [
                      Image.asset('assests/ham-200.png', height: 70, width: 50),
                      // height: 50, width: 30),
                      Text('Find\nLawyer'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => appointment(),
                      ));
                },
                child: Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => appointment()));
                        },
                        child: Image.asset('assests/app.png',
                            height: 70, width: 50),
                        // height: 50, width: 30),
                      ),
                      Text('Appointments'),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Select Service',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.red),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ask for legal service',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 100,
                  width: 183,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.amber,
                  ),
                  child: Center(child: Text('Legal Services')),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25,
              ),
              Text('342 results'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.amber,
              ),
              child: appointmentList()),
        ]),
      ),
    ));
  }

  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      appointment(),
      ChatScreen(),
      Notifications(),
      myprofile(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff01411C),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

// ignore: prefer_const_literals_to_create_immutable
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: Icon(Icons.message_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Notification',
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
