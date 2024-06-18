// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/MessaeHistory.dart';
import 'package:wakeel_app/appointmentList.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'My_profile.dart';
import 'my_booking.dart';
import 'profile_setting.dart';
import 'schedule.dart';
import 'menu.dart';
import 'chatwidget.dart';
import 'appointment.dart';
import 'LEGAL.dart';
import 'find_lawyer.dart';
import 'lawyer_profile.dart';
import 'notfications_screen.dart';
import 'profile_screen.dart';

class legalservices extends StatefulWidget {
  const legalservices({super.key});

  @override
  State<legalservices> createState() => _legalservicesState();
}

class _legalservicesState extends State<legalservices> {
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
                      Text('    Book\nEmergency'),
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
                      Text('  Legal\nService'),
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
                      Text('  Find\nLawyer'),
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
                      Text('       Book\nAppointments'),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text('Common Services',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(Constants.App_txt_color))),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => findlawyer()));
                  },
                  child: Column(
                    children: [
                      Image.asset('assests/cs1.PNG', height: 50, width: 50),
                      Text('Cheque Bounce'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assests/cs2.PNG', height: 50, width: 50),
                    Text('Supreme Court'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assests/cs5.PNG', height: 50, width: 50),
                    Text('Child Custody'),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/cs4.PNG', height: 50, width: 50),
                  Text('Criminal'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/cs3.PNG', height: 50, width: 50),
                  Text('Property'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/cs6.PNG', height: 50, width: 50),
                  Text('Divorce'),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(children: [
            Expanded(
              child: Column(children: [
                Image.asset('assests/cc.png', height: 50, width: 50),
                SizedBox(
                  height: 8,
                ),
                Text('Cyber crime'),
              ]),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/tax.png', height: 50, width: 50),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Taxtation'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/imii.png', height: 50, width: 50),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Immigration'),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text('More Legal issues:',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(Constants.App_txt_color))),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 20,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Human Rights',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          //banking
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Banking matters',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          // family
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Family Dispute',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          // company
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Company Registration',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          // contacts
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Contracts and Documentations',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          //medical
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Medical Negligence',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          // consumer
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Consumer court',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScheduleScreen()));
                },
                child: Text('Schedule',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(Constants.App_txt_color))),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ]),
      ),
    ));
  }

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      homeScreen(),
      appointmentList(),
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
                    label: 'Home',
                    icon: Image.asset(
                        'assests/home_icon.png'), //Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: 'Book',
                    icon: Image.asset(
                        'assests/appointment_icon.png'), //Icon(Icons.notifications),
                  ),
                  BottomNavigationBarItem(
                    label: 'Messages',
                    icon: Image.asset(
                        'assests/message_icon.png'), //Icon(Icons.message_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: 'Notifications',
                    icon: Image.asset(
                        'assests/notification_icon.png'), //Icon(Icons.notifications),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Image.asset(
                        'assests/profile_icon.png'), //Icon(Icons.person),
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
