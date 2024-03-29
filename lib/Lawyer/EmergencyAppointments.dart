import 'package:flutter/material.dart';
import 'package:wakeel_app/Constant.dart';

import 'package:wakeel_app/chatwidget.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';


class EmergencyAppointments extends StatefulWidget {
  const EmergencyAppointments({super.key});

  @override
  State<EmergencyAppointments> createState() => _EmergencyAppointmentsState();
}

class _EmergencyAppointmentsState extends State<EmergencyAppointments> {
  final List<Map<String, String>> appointments = [
    {
      'lawyer_avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'appointment_date': '25/06/2022',
      'appointment_time': '5:00 pm',
      'lawyer_name': 'Fury',
      'package_name': 'Silver',
      'price': '2000.00',
      'meeting_type': 'Office Consultation',
      'meeting_duration': '2 hrs',
    },
    {
      'lawyer_avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'appointment_date': '25/06/2022',
      'appointment_time': '5:00 pm',
      'lawyer_name': 'Fury',
      'package_name': 'Silver',
      'price': '2000.00',
      'meeting_type': 'Chat',
      'meeting_duration': '2 hrs',
    },
    {
      'lawyer_avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'appointment_date': '25/06/2022',
      'appointment_time': '5:00 pm',
      'lawyer_name': 'Fury',
      'package_name': 'Silver',
      'price': '2000.00',
      'meeting_type': 'Chat',
      'meeting_duration': '2 hrs',
    },
    {
      'lawyer_avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'appointment_date': '25/06/2022',
      'appointment_time': '5:00 pm',
      'lawyer_name': 'Fury',
      'package_name': 'Silver',
      'price': '2000.00',
      'meeting_type': 'Chat',
      'meeting_duration': '2 hrs',
    },
    {
      'lawyer_avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'appointment_date': '25/06/2022',
      'appointment_time': '5:00 pm',
      'lawyer_name': 'Fury',
      'package_name': 'Silver',
      'price': '2000.00',
      'meeting_type': 'Chat',
      'meeting_duration': '2 hrs',
    },
    // Add more appointment data here
  ];

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFCA9D3E),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(child: Text('Accept')),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 25,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 19, 59, 20),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                      'Decline',
                                      style: TextStyle(color: Colors.white),
                                    )),
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
        ));
  }
}
