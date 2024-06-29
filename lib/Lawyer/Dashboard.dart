// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/Lawyer/EmergencyAppointments.dart';
import 'package:wakeel_app/Lawyer/LAppointments.dart';
import 'package:wakeel_app/Lawyer/LMessaeHistory.dart';
import 'package:wakeel_app/Lawyer/LMyProfile.dart';
import 'package:wakeel_app/Lawyer/LNotifications.dart';
import 'package:wakeel_app/Lawyer/NewAppointments.dart';
import 'package:wakeel_app/Lawyer/UpcomingAppointments.dart';
import 'package:wakeel_app/MessaeHistory.dart';
import 'package:wakeel_app/My_profile.dart';
import 'package:wakeel_app/notfications_screen.dart';
import 'package:wakeel_app/profile_setting.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  int _tabIndex = 0;

  final List<Widget> _Tabs = [
    EmergencyAppointments(),
    NewAppointments(),

  ];

  Widget homeScreen() {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: WakeelAppBar(back: false),
      ),
      body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _tabIndex = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset('assests/book.png', height: 40, width: 40),
                      SizedBox(height: 8), // Adding space of 8 pixels between the image and text
                      Text(
                        'Emergency\nAppointments',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _tabIndex = 1;
                    });
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => legalser()));
                  },
                  child: Column(
                    children: [
                      Image.asset('assests/app.png', height: 40, width: 40),
                      SizedBox(height: 8), // Adding space of 8 pixels between the image and text
                      Text(
                        'New Invites\nAppointments',
                        textAlign: TextAlign
                            .center, // Optional: Align text within its container
                      ),
                    ],
                  ),
                ),
              ),

            ]),
          ),
          SizedBox(height: 10), // Adding space of 8 pixels between the image and text
        Expanded(
          child: Container(
            child: _Tabs[_tabIndex],
          ),
        ),

        ]),

    ));
  }

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      EmergencyAppointments(),
      UpcomingAppointments(),
      // LAppointments(),
      LMyProfile(),
      profilesetting(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(Constants.App_green_color),
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
                items: [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Image.asset(
                        'assests/home_icon.png'), //Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: 'Appointments',
                    icon: Image.asset(
                        'assests/appointment_icon.png'), //Icon(Icons.notifications),
                  ),

                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Image.asset(
                        'assests/profile_icon.png'), //Icon(Icons.notifications),
                  ),
                  BottomNavigationBarItem(
                    label: 'Settings',
                    icon: Image.asset(
                        'assests/setting_icon.png'), //Icon(Icons.person),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
