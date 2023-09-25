import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'package:wakeel_app/Constant.dart';
import 'notfications_screen.dart';
import 'My_profile.dart';
import 'package:wakeel_app/MessaeHistory.dart';

import 'profile_setting.dart';

class legalser extends StatefulWidget {
  const legalser({super.key});

  @override
  State<legalser> createState() => _legalserState();
}

class _legalserState extends State<legalser> {

  int _currentIndex = 0;
  Widget homeScreen() {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Services',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 16), // Add some spacing between the texts
                Text(
                  'Check Bounce',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Fill in the form:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 305,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 305,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 305,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 305,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Description:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  height: 130,
                  width: 305,
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      // Green label text color
                      focusColor: Colors.black,
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: const Color(0xFF000000), width: 1.0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xff01411C),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(child: Text('Save')),
            ),
          ],
        ),
      ),
    ));
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
