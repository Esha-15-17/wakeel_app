import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:http/http.dart' as http;
import 'package:wakeel_app/wakeel_app_bar.dart';

class MessageHistory extends StatefulWidget {
  const MessageHistory({super.key});

  @override
  State<MessageHistory> createState() => _MessageHistoryState();
}

class _MessageHistoryState extends State<MessageHistory> {
  List<Map<String, String>> appointments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final url = Uri.parse('${Constants.API_URL}/get-user-appointments');
    // final response = await http.get(url);

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
      if (data['success']) {
        final data = json.decode(response.body);
        print("data");
        print(data);
        final List<Map<String, String>> loadedAppointments = [];
        for (var appointment in data['appointments']) {
          loadedAppointments.add({
            'id': appointment['id'].toString() ?? '',
            'lawyer_avatar':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
            'appointment_date': appointment['appointment_date'],
            'appointment_time': appointment['appointment_time'],
            'lawyer_name': appointment['lawyer_name'],
            'package_name': appointment['package_name'],
            'price': appointment['price'],
            'meeting_type': appointment['meeting_type'],
            'meeting_duration': appointment['meeting_duration'],
          });
        }

        setState(() {
          appointments = loadedAppointments;
          isLoading = false;
        });

        // setState(() {
        //   appointments = (data['appointments']).map((appointment) {
        //     return {
        //       'lawyer_avatar':
        //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
        //       'appointment_date': appointment['appointment_date'],
        //       'appointment_time': appointment['appointment_time'],
        //       'lawyer_name': appointment['lawyer_name'],
        //       'package_name': appointment['package_name'],
        //       'price': appointment['price'],
        //       'meeting_type': appointment['meeting_type'],
        //       'meeting_duration': appointment['meeting_duration'],
        //     };
        //   }).toList();
        //   isLoading = false;
        // });
      }
    } else {
      // Handle error
      setState(() {
        isLoading = false;
      });
      print('Failed to load appointments');
      print(response.statusCode);
    }
  }

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: WakeelAppBar(back: false),
          ),
          body: ListView.builder(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFCA9D3E),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(child: Text('Chat')),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              // Container(
                              //   height: 25,
                              //   width: 80,
                              //   decoration: BoxDecoration(
                              //       color: const Color.fromARGB(255, 19, 59, 20),
                              //       borderRadius: BorderRadius.circular(15)),
                              //   child: const Center(
                              //       child: Text(
                              //         'Cancel',
                              //         style: TextStyle(color: Colors.white),
                              //       )),
                              // ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  appointment['lawyer_name']!,
                                  style: const TextStyle(
                                    color: Color(0xFFCA9D3E),
                                    // Set the desired text color
                                    fontWeight: FontWeight
                                        .bold, // You can adjust other styles as needed
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Image.network(
                                    height: 55,
                                    width: 55,
                                    appointment['lawyer_avatar']!),

                                // Use the avatar URL
                              ],
                            ),
                            const SizedBox(
                              width: 33,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Consultation Type',
                                    style: TextStyle(
                                      color: Color(0xFF01411C),
                                      // Set the desired text color
                                      fontWeight: FontWeight
                                          .normal, // You can adjust other styles as needed
                                    ),
                                  ),
                                  const Text(
                                    'Consultation Time',
                                    style: TextStyle(
                                      color: Color(0xFF01411C),
                                      // Set the desired text color
                                      fontWeight: FontWeight
                                          .normal, // You can adjust other styles as needed
                                    ),
                                  ),
                                  const Text(
                                    'Promo Code',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF01411C),
                                      // Set the desired text color
                                      fontWeight: FontWeight
                                          .normal, // You can adjust other styles as needed
                                    ),
                                  ),
                                  Text(
                                    "ASK${appointment['price']!}",
                                    style: const TextStyle(
                                      color: Color(0xFFCA9D3E),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appointment['meeting_type']!,
                                    style: const TextStyle(
                                      color: Color(0xFF01411C),
                                    ),
                                  ),
                                  Text(
                                    appointment['appointment_date']!,
                                    style: const TextStyle(
                                      color: Color(0xFF01411C),
                                    ),
                                  ),
                                  Text(
                                    appointment['appointment_time']!,
                                    style: const TextStyle(
                                      color: Color(0xFF01411C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}