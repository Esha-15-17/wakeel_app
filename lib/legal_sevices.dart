// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
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
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.1),
            child: Container(
              height: 55,
              width: double.infinity,
              color: const Color.fromARGB(255, 32, 91, 34),
              child: Row(
                children: [
                  Image.asset('assests/wakeel2_removebg_preview.png'),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 40,
                    width: 220,
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          hintText: 'Search',
                          contentPadding: const EdgeInsets.all(8.0),
                          suffixIcon: const Icon(Icons.search,color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            //  borderSide: BorderSide(color: Colors.white)
                          )),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => menu(),
                            ));
                      },
                      child: Icon(
                        Icons.view_headline_sharp,color: Colors.white
                      )),
                ],
              ),
            ),
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
                      Image.asset('assests/book.png',
                          height: 70, width: 50), //height: 50, width: 30),
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
                      Image.asset('assests/ls.png',
                          height: 70, width: 50),
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
                      Image.asset('assests/ham-200.png',
                          height: 70, width: 50),
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
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text('Common Services',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10,
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
                    Image.asset('assests/cs3.PNG', height: 50, width: 50),
                    Text('Property'),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 30,
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
                  Image.asset('assests/cs5.PNG', height: 50, width: 50),
                  Text('Child Custody'),
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
            height: 30,
          ),
          Row(children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/cc.png', height:50 , width:50),
                  Text('Cyber crime'),
                ]
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/tax.png', height: 50, width: 50),
                  Text('Taxtation'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assests/imii.png', height: 50, width: 50),
                  Text('Immigration'),
                ],
              ),
            ),
          ]),



          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text('More Legal issues:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Human Rights',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 206,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Banking matters',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 190,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Family Dispute',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 199,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Company Registration',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 152,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contracts and Documentations',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 95,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Medical Negligence',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 165,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Consumer court',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 192,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleScreen()));
                  },
                  child: Text('Schedule',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 92,
          ),
        ]),
      ),
    )
    );
  }

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      homeScreen(),
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
