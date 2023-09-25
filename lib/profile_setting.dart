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
  int _currentIndex = 0;

  Widget homeScreen() {
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

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      homeScreen(),
      MessageHistory(),
      Notifications(),
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
                    label: '',
                    icon: Image.asset(
                        'assests/home_icon.png'), //Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Image.asset(
                        'assests/message_icon.png'), //Icon(Icons.message_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Image.asset(
                        'assests/notification_icon.png'), //Icon(Icons.notifications),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Image.asset(
                        'assests/profile_icon.png'), //Icon(Icons.person),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10, // Adjust the bottom position as needed
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Handle the tap on the plus icon here
                },
                child: Container(
                  height: 60, // Set the desired height for the image
                  decoration: BoxDecoration(
                    color: Color(Constants.App_green_color),
                    // Customize the background color
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 19, // Adjust the bottom position as needed
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Handle the tap on the plus icon here
                },
                child: Container(
                  height: 42, // Set the desired height for the image
                  decoration: BoxDecoration(
                    color: Color(Constants.App_green_circle_color),
                    // Customize the background color
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 16, // Set the size of the plus icon
                      color: Color(Constants
                          .App_yellow_color), // Customize the icon color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
