import 'package:flutter/material.dart';
import 'package:wakeel_app/my_booking.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'profile_setting.dart';
import 'schedule.dart';
import 'appointment.dart';
import 'booking.dart';
import 'menu.dart';
import 'legal_sevices.dart';
import 'package:wakeel_app/Constant.dart';
import 'notfications_screen.dart';
import 'My_profile.dart';
import 'package:wakeel_app/MessaeHistory.dart';

class BookEmergency extends StatefulWidget {
  const BookEmergency({super.key});

  @override
  State<BookEmergency> createState() => _BookEmergencyState();
}

class _BookEmergencyState extends State<BookEmergency> {
  int _currentIndex = 0;

  Widget homeScreen() {
    return  SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: WakeelAppBar(back: true),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Color(0xff01411C)),
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    suffixIcon: Icon(Icons.pin_drop),
                    focusColor: Color(0xff01411C),
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                        BorderSide(color: Color(0xff01411C), width: 2.0)),
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 150,
              child: Center(
                  child: Text(
                    'Compose',
                    style: TextStyle(color: Colors.white),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 20, 77, 22),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Booking History',style:TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cheque Bounce',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('23 March 2023'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('07 Approached ',style: TextStyle(color: Colors.blueGrey),),
                          Text(' | '),
                          Text(' 28 Impressions',style: TextStyle(color: Colors.blueGrey),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text('Lorem ipsum has been the industry standard \ndummy text ever since the 1500s..')],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Solved By',style: TextStyle(color: Colors.blueGrey),),
                          Text('Adv Javaid Iqbal',style: TextStyle(color: Colors.blueGrey),),
                          Container(
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text(
                                'View Profile',
                                style: TextStyle(color: Color(Constants.App_yellow_color)),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 32, 112, 35),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cheque Bounce',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('23 March 2023'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('07 Approached ',style: TextStyle(color: Colors.blueGrey),),
                          Text(' | '),
                          Text(' 28 Impressions',style: TextStyle(color: Colors.blueGrey),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text('Lorem ipsum has been the industry standard \ndummy text ever since the 1500s..')],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Solved By',style: TextStyle(color: Colors.blueGrey),),
                          Text('Adv Javaid Iqbal',style: TextStyle(color: Colors.blueGrey),),
                          Container(
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text(
                                'View Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 32, 112, 35),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cheque Bounce',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('23 March 2023'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('07 Approached ',style: TextStyle(color: Colors.blueGrey),),
                          Text(' | '),
                          Text(' 28 Impressions',style: TextStyle(color: Colors.blueGrey),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text('Lorem ipsum has been the industry standard \ndummy text ever since the 1500s..')],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Solved By',style: TextStyle(color: Colors.blueGrey),),
                          Text('Adv Javaid Iqbal',style: TextStyle(color: Colors.blueGrey),),
                          Container(
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text(
                                'View Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 32, 112, 35),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      homeScreen(),
      MessageHistory(),
      // ChatScreen(),
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