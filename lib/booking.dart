// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/booking.dart';
import 'appointment.dart';
import 'find_lawyer.dart';
import 'LEGAL.dart';
import 'legal_sevices.dart';
import 'chatwidget.dart';

class booking extends StatelessWidget {
  const booking({super.key});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => booking()));
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/Capture.png',
                            height: 50, width: 30),
                        Text('Book/Emergency'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => legalser(),
                          ));
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/Capture1.png',
                            height: 50, width: 30),
                        Text('Legal Service'),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => findlawyer(),
                        ));
                  },
                  child: Expanded(
                    child: Column(
                      children: [
                        Image.asset('assests/Capture2.png',
                            height: 50, width: 30),
                        Text('Find Lawyer'),
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
                          child: Image.asset('assests/Capture3.png',
                              height: 50, width: 30),
                        ),
                        Text('Appointments'),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Select Service',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                    child: Center(child: Text('Legal Services')),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.amber,
                    ),
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
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
                              height: 10,
                            ),
                            Image.asset('assests/LAW.PNG')
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Defense Karachi'),
                            Text('10 years'),
                            Text('Promo Code'),
                            Text('ASKL2000'),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text('10+ Consult'),
                            Icon(Icons.star),
                            SizedBox(
                              width: 5,
                            ),
                            Text('3.5'),
                            Text('1278 Ratings'),
                            Text.rich(
                              TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: '\RS 7000 ',
                                    style: new TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  new TextSpan(
                                    text: ' \ RS 5000',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ChatScreen()));
                            },
                            child: Container(
                              height: 25,
                              width: 80,
                              child: Center(child: Text('Chat')),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 25,
                            width: 80,
                            child: Center(
                                child: Text(
                              'Book Now',
                              style: TextStyle(color: Colors.white),
                            )),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 19, 59, 20),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
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
                              height: 10,
                            ),
                            Image.asset('assests/LAW.PNG')
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text('Defense Karachi'),
                            Text('10 years'),
                            Text('Promo Code'),
                            Text('ASKL2000'),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text('10+ Consult'),
                            Icon(Icons.star),
                            SizedBox(
                              width: 5,
                            ),
                            Text('3.5'),
                            Text('1278 Ratings'),
                            Text.rich(
                              TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: '\RS 7000 ',
                                    style: new TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  new TextSpan(
                                    text: ' \ RS 5000',
                                  ),
                                ],
                              ),
                            )
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
                            width: 80,
                            child: Center(child: Text('Chat')),
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
                                  'Book Now',
                                  style: TextStyle(color: Colors.white),
                                )),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 19, 59, 20),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
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
                              height: 10,
                            ),
                            Image.asset('assests/LAW.PNG')
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children:
                          [
                            Text('Defense Karachi'),
                            Text('10 years'),
                            Text('Promo Code'),
                            Text('ASKL2000'),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text('10+ Consult'),
                            Icon(Icons.star),
                            SizedBox(
                              width: 5,
                            ),
                            Text('3.5'),
                            Text('1278 Ratings'),
                            Text.rich(
                              TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: '\RS 7000 ',
                                    style: new TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  new TextSpan(
                                    text: ' \ RS 5000',
                                  ),
                                ],
                              ),
                            )
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
                            width: 80,
                            child: Center(child: Text('Chat')),
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
                                  'Book Now',
                                  style: TextStyle(color: Colors.white),
                                )),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 19, 59, 20),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
        ),
      ),
    );
  }
}

