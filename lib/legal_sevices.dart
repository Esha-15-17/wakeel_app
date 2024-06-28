import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/MessaeHistory.dart';
import 'package:wakeel_app/appointmentList.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'cs/cb.dart';
import 'cs/childcustody.dart';
import 'cs/criminal.dart';
import 'cs/cybercrime.dart';
import 'cs/divorce.dart';
import 'cs/immigration.dart';
import 'cs/property.dart';
import 'cs/supreme.dart';
import 'cs/taxation.dart';
import 'find_lawyer.dart';
import 'notfications_screen.dart';

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
          preferredSize: const Size.fromHeight(50),
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
                            Image.asset('assests/book.png',
                                height: 70, width: 50),
                            const Text('    Book\nEmergency'),
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
                            Image.asset('assests/ham-200.png',
                                height: 70, width: 50),
                            const Text('  Find\nLawyer'),
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
                            Image.asset('assests/app.png',
                                height: 70, width: 50),
                            const Text('       Book\nAppointments'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Row(
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

              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChequeBounceLawScreen()),
                          );
                          // Navigate to Criminal creen
                        }
                        ;
                        // Navigate
                        // Navigate to Cheque Bounce screen
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
                    child: InkWell(
                      onTap: () {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SupremeCourtLawScreen()),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Image.asset('assests/cs2.PNG', height: 50, width: 50),
                          Text('Supreme Court'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Navigate to Child Custody screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChildCustodyScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('assests/cs5.PNG', height: 50, width: 50),
                          Text('Child Custody'),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),

              const SizedBox(height: 15),
              Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CriminalLawScreen()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/cs4.PNG', height: 50, width: 50),
                        const Text('Criminal'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PropertyLawScreen()),
                        );
                        // Navigate to Criminal creen
                      }
                      ;
                      // Navigate to Property screen
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/cs3.PNG', height: 50, width: 50),
                        const Text('Property'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DivorceLawScreen()),
                          );
                        }
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/cs6.PNG', height: 50, width: 50),
                        const Text('Divorce'),
                      ],
                    ),
                  ),
                ),
              ]),

              const SizedBox(height: 20),
              Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CybercrimeLawScreen()),
                          );
                        }
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/cc.png', height: 50, width: 50),
                        const SizedBox(height: 8),
                        const Text('Cyber Crime'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaxationLawScreen()),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/tax.png', height: 50, width: 50),
                        const SizedBox(height: 8),
                        const Text('Taxation'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImmigrationLawScreen()),
                        );
                        // Navigate to Criminal creen
                      }
                      ;

                      // Navigate to Immigration screen
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/imii.png', height: 50, width: 50),
                        const SizedBox(height: 8),
                        const Text('Immigration'),
                      ],
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              const Row(
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
              const SizedBox(height: 15),
              SizedBox(
                height: 20,
                child: InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Women Rights',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Banking matters',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
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
            ],
          ),
        ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
