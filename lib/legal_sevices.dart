// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class LegalServices extends StatefulWidget {
  const LegalServices({super.key});

  @override
  State<LegalServices> createState() => _LegalServicesState();
}

class _LegalServicesState extends State<LegalServices> {
  int _currentIndex = 0;
  List<dynamic> services = [];

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  Future<void> fetchServices() async {
    final url = Uri.parse('${Constants.API_URL}/show-all-services');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        services = data['services'];
      });
    } else {
      throw Exception('Failed to load services');
    }
  }

  Widget homeScreen() {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: WakeelAppBar(back: false),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 2; // Open Book tab
                          });
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
                          setState(() {
                            _currentIndex = 0; // Open Legal Services tab
                          });
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
                          setState(() {
                            _currentIndex = 1; // Open Find Lawyer tab
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset('assests/ham-200.png', height: 70, width: 50),
                            Text('  Find\nLawyer'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 2; // Open Book Appointments tab
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset('assests/app.png', height: 70, width: 50),
                            Text('       Book\nAppointments'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'Common Services',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(Constants.App_txt_color),
                    ),
                  ),
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
                  SizedBox(width: 20),
                  Text(
                    'More Legal issues:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(Constants.App_txt_color),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
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
<<<<<<< Updated upstream
              //banking
=======
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assests/1396573.png', height: 50, width: 50),
                    Text('Supreme Court'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assests/child.png', height: 50, width: 50),
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
                  Image.asset('assests/crime.png', height: 50, width: 50),
                  Text('Criminal'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/property.png', height: 50, width: 50),
                  Text('Property'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/divorce.png', height: 50, width: 50),
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
>>>>>>> Stashed changes
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
              // Repeat for more legal issues, if you have dynamic data for them
              // For now, keep it static as per your original implementation
            ],
          ),
<<<<<<< Updated upstream
        ),
=======
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
                        color: Color(Constants.App_txt_color),

                    )),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ]),
>>>>>>> Stashed changes
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      homeScreen(),
      FindLawyer(),
      appointmentList(),
      MessageHistory(),
      Notifications(),
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
                    icon: Image.asset('assests/home_icon.png'),
                  ),
                  BottomNavigationBarItem(
                    label: 'Find Lawyer',
                    icon: Image.asset('assests/notification_icon.png'),
                  ),
                  BottomNavigationBarItem(
                    label: 'Book',
                    icon: Image.asset('assests/appointment_icon.png'),
                  ),
                  BottomNavigationBarItem(
                    label: 'Appointments',
                    icon: Image.asset('assests/message_icon.png'),
                  ),
                  BottomNavigationBarItem(
                    label: 'Chat Bot',
                    icon: Image.asset('assests/profile_icon.png'),
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
