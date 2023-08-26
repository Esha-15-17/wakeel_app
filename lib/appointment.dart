// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/appointment.dart';
import 'package:wakeel_app/profile_screen.dart';
import 'booking.dart';
import 'chatwidget.dart';
import 'my_booking.dart';
import 'legal_sevices.dart';
import 'find_lawyer.dart';
import 'LEGAL.dart';



class appointment extends StatelessWidget {
  const appointment({super.key});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.5),
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
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                hintText: 'Search',
                                contentPadding: const EdgeInsets.all(8.0),
                                suffixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  //  borderSide: BorderSide(color: Colors.white)
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 0,
                                ),
                                Text('Adv. Bashir'),
                                Text('Momin'),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.asset('assests/LAW.PNG')
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Text('Consultation Type'),
                                Text('Consultation Time'),
                                Text('Promo Code'),
                                Text('ASKL2000'),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Text('Chat'),
                                Text('25/06/2022'),
                                Text('05:00 pm'),
                              ],
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                width: 100,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileScreen()));
                                    },
                                    child: Center(child: Text('View profile'))),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ChatScreen()));
                                },
                                child: Container(
                                  height: 25,
                                  width: 80,
                                  child: Center(
                                      child: Text(
                                    'Chat',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 19, 59, 20),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Adv. Bashir'),
                                Text('Momin'),
                                SizedBox(
                                  height: 15,
                                ),
                                Image.asset('assests/Frame2.png')
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Consultation Type'),
                                Text('Consultation Time'),
                                Text('Promo Code'),
                                Text('ASKL2000'),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Chat'),
                                Text('25/06/2022'),
                                Text('05:00 pm'),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                width: 100,
                                child: Center(child: Text('View Profile')),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 25,
                                width: 80,
                                child: Center(
                                    child: Text(
                                  'Chat',
                                  style: TextStyle(color: Colors.white),
                                )),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 19, 59, 20),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Adv. Bashir'),
                                Text('Momin'),
                                SizedBox(
                                  height: 15,
                                ),
                                Image.asset('assests/Frame2.png')
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Consultation Type'),
                                Text('Consultation Time'),
                                Text('Promo Code'),
                                Text('ASKL2000'),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Chat'),
                                Text('25/06/2022'),
                                Text('05:00 pm'),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                width: 100,
                                child: Center(child: Text('View Profile')),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 25,
                                width: 80,
                                child: Center(
                                    child: Text(
                                  'Chat',
                                  style: TextStyle(color: Colors.white),
                                )),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 19, 59, 20),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Adv. Bashir'),
                                Text('Momin'),
                                SizedBox(
                                  height: 15,
                                ),
                                Image.asset('assests/Frame2.png')
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Consultation Type'),
                                Text('Consultation Time'),
                                Text('Promo Code'),
                                Text('ASKL2000'),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Chat'),
                                Text('25/06/2022'),
                                Text('05:00 pm'),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                width: 100,
                                child: Center(child: Text('View Profile')),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 25,
                                width: 80,
                                child: Center(
                                    child: Text(
                                  'Chat',
                                  style: TextStyle(color: Colors.white),
                                )),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 19, 59, 20),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 247,
                ),
              ]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xff01411C),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(.60),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              onTap: (value) {
                // Respond to item press.
              },
              // ignore: prefer_const_literals_to_create_immutables
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
            )));
  }
}
