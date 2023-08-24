// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/find_lawyer.dart';
import 'appointment.dart';
import 'booking.dart';
import 'chatwidget.dart';
import 'My_profile.dart';
import 'notfications_screen.dart';
import 'profile_screen.dart';
import 'legal_sevices.dart';
import 'LEGAL.dart';
import 'my_booking.dart';

class findlawyer extends StatefulWidget {
  const findlawyer({super.key});

  @override
  State<findlawyer> createState() => _findlawyerState();
}

class _findlawyerState extends State<findlawyer> {
  int _currentIndex = 0;
  // This widget is the root of your application.
  Widget findlawyer() {

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
                  Image.asset('assests/wakeel2-removebg-preview.png'),
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
              height: 10,
            ),
            Container(
              height: 33,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search By Name',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  Icon(Icons.arrow_drop_down)

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'TOP Check Bounce Advocates',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
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
                            Text('ASKL2000',style: TextStyle(color: Colors.amber),),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text('10+ Consult'),
                            Row(
                              children: [
                                Icon(Icons.star,
                                color: Colors.amber,),
                              SizedBox(
                                width:5,
                              ),
                             Text('3.5',style:TextStyle(color: Colors.amber),),],),
                            Text('1278 Ratings'),
                            Text.rich(
                              TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: '\RS 7000 ',
                                    style: new TextStyle(
                                      color: Colors.amber,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  new TextSpan(
                                    text: ' \ RS 5000',style:TextStyle(color: Colors.amber)
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
                                  MaterialPageRoute(builder: (context) => ChatScreen ()));
                            },
                            child: Container(
                              height: 25,
                              width: 80,
                              child: Center(child: Text('online')),
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
                                  'chat',
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
                            Text('ASKL2000',style:TextStyle(color: Colors.amber),),
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
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.amber),
                            Text('3.5',style:TextStyle (color: Colors.amber),),],),
                            Text('1278 Ratings'),
                            Text.rich(
                              TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: '\RS 7000 ',
                                    style: new TextStyle(
                                      color: Colors.amber,
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
                            child: Center(child: Text('offline')),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
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
                                  'chat',
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
                            Text('ASKL2000',style:TextStyle(color: Colors.amber)),
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
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.amber,),
                                Text('3.5',style:TextStyle (color: Colors.amber),),],),
                            Text('1278 Ratings'),
                            Text.rich(
                              TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: '\RS 7000 ',
                                    style: new TextStyle(
                                      color: Colors.amber,
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
                            child: Center(child: Text('online')),
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
                                  'chat',
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
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            SizedBox(
              height: 247,
            ),
          ]),
        ),


      ),
    );
  }


Widget build (BuildContext context) {
  final List<Widget> _screens = [
    legalservices(),
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


