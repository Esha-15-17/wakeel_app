import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/profile_screen.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class appointmentList extends StatefulWidget {
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<appointmentList> {
  List<Map<String, String>> appointments = [];

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final url = Uri.parse('${Constants.API_URL}/showall-lawyers');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("data");
      print(data);
      final List<Map<String, String>> loadedAppointments = [];
      for (var lawyer in data['lawyers']) {
        loadedAppointments.add({
          'id': lawyer['id'].toString() ?? '',
          'profile': lawyer['profile'] ?? '',
          'name': lawyer['name'] ?? '',
          'email': lawyer['email'] ?? '',
          'gender': lawyer['gender'] ?? '',
          'court': lawyer['court'] ?? '',
          'experience': lawyer['experience'] ?? '',
          'residential_area': lawyer['residential_area'] ?? '',
          'languages_spoken': lawyer['languages_spoken'] ?? '',
          'zip_code': lawyer['zip_code'] ?? '',
          'about_me': lawyer['about_me'] ?? '',
        });
      }
      // print("{$loadedAppointments}");

      setState(() {
        appointments = loadedAppointments;
      });
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    print('render');

    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: WakeelAppBar(back: false),
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Choose your Lawyer",
                    style: TextStyle(
                      color: Color(Constants.App_green_color),
                      fontWeight: FontWeight.bold,
                      fontSize:
                          18, // You can change this value to make the text bigger or smaller
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: appointments.length,
                    itemBuilder: (context, index) {
                      final appointment = appointments[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF01411C)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Image.asset(
                                            (appointment['gender']! == "female")
                                                ? 'assests/female.PNG'
                                                : 'assests/male.PNG',
                                            height: 65,
                                            width: 65),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          appointment['name']!,
                                          style: const TextStyle(
                                            color: Color(0xFFCA9D3E),
                                            // Set the desired text color
                                            fontWeight: FontWeight
                                                .bold, // You can adjust other styles as needed
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Court',
                                            style: TextStyle(
                                              color: Color(0xFF01411C),
                                              // Set the desired text color
                                              fontWeight: FontWeight
                                                  .normal, // You can adjust other styles as needed
                                            ),
                                          ),
                                          Text(
                                            'Experience',
                                            style: TextStyle(
                                              color: Color(0xFF01411C),
                                              // Set the desired text color
                                              fontWeight: FontWeight
                                                  .normal, // You can adjust other styles as needed
                                            ),
                                          ),
                                          Text(
                                            'Area',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color(0xFF01411C),
                                              // Set the desired text color
                                              fontWeight: FontWeight
                                                  .normal, // You can adjust other styles as needed
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            appointment['court']!,
                                            style: const TextStyle(
                                              color: Color(0xFF01411C),
                                            ),
                                          ),
                                          Text(
                                            appointment['experience']!,
                                            style: const TextStyle(
                                              color: Color(0xFF01411C),
                                            ),
                                          ),
                                          Text(
                                            appointment['residential_area']!,
                                            style: const TextStyle(
                                              color: Color(0xFF01411C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileScreen(
                                                        lawyerId:
                                                            appointment['id']!,
                                                      )));
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFCA9D3E),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: const Center(
                                              child: Text('View Profile', style: TextStyle(color: Color(Constants.App_yellow_color)))),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          launch('sms:');
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 19, 59, 20),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Chat',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}
