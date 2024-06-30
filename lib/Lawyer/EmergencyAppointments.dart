import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/chatwidget.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'package:intl/intl.dart';

class EmergencyAppointments extends StatefulWidget {
  const EmergencyAppointments({super.key});

  @override
  State<EmergencyAppointments> createState() => _EmergencyAppointmentsState();
}

class _EmergencyAppointmentsState extends State<EmergencyAppointments> {
  late List<Map<String, dynamic>> appointments = [];

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final url = Uri.parse('${Constants.API_URL}/get-emergency-appointments');

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          appointments =
              List<Map<String, dynamic>>.from(jsonData['appointments']);
        });
      } else {
        throw Exception('Failed to load appointments');
      }
    } catch (error) {
      print('Error fetching appointments: $error');
      // Handle error as needed
    }
  }

  Future<void> handleAccept(Map<String, dynamic> appointment) async {
    var appointmentId = appointment['id'];
    final url = Uri.parse('${Constants.API_URL}/accept-appointment');

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'appointment_id': appointmentId,
        }),
      );

      if (response.statusCode == 200) {
        fetchAppointments(); // Refresh the appointments list after accepting
      } else {
        print(appointmentId);
        throw Exception('Failed to accept appointment');
      }
    } catch (error) {
      print('Error accepting appointment: $error');
      // Handle error as needed
    }
  }

  Future<void> handleDecline(int appointmentId) async {
    final url = Uri.parse('${Constants.API_URL}/decline-appointment');

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'appointment_id': appointmentId,
        }),
      );

      if (response.statusCode == 200) {
        fetchAppointments(); // Refresh the appointments list after declining
      } else {
        throw Exception('Failed to decline appointment');
      }
    } catch (error) {
      print('Error declining appointment: $error');
      // Handle error as needed
    }
  }

  @override
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
            // Format appointment date
            final formattedDate = DateFormat.yMMMMd().format(DateTime.parse(appointment['appointment_date']));

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
                              const Text(
                                '',
                                style: TextStyle(
                                  color: Color(0xFFCA9D3E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Use a placeholder image for the lawyer's avatar
                              Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
                                height: 55,
                                width: 55,
                              ),
                            ],
                          ),
                          const SizedBox(width: 33),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Consultation Type',
                                  style: TextStyle(
                                    color: Color(0xFF01411C),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Text(
                                  'Consultation Time',
                                  style: TextStyle(
                                    color: Color(0xFF01411C),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Text(
                                  'Promo Code',
                                  style: TextStyle(
                                    color: Color(0xFF01411C),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  "ASK${appointment['price']}",
                                  style: const TextStyle(
                                    color: Color(0xFFCA9D3E),
                                    fontWeight: FontWeight.normal,
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
                                  appointment['specialization'],
                                  style: const TextStyle(
                                    color: Color(0xFF01411C),
                                  ),
                                ),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    color: Color(0xFF01411C),
                                  ),
                                ),
                                Text(
                                  appointment['appointment_time'],
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
                            GestureDetector(
                              // onTap: () => handleAccept(appointment['id']),
                              onTap: () => handleAccept(appointment),
                              child: Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFCA9D3E),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(child: Text('Accept')),
                              ),
                            ),
                            const SizedBox(width: 15),
                            // GestureDetector(
                            //   onTap: () => handleDecline(appointment['id']),
                            //   child: Container(
                            //     height: 25,
                            //     width: 80,
                            //     decoration: BoxDecoration(
                            //       color: const Color.fromARGB(255, 19, 59, 20),
                            //       borderRadius: BorderRadius.circular(15),
                            //     ),
                            //     child: const Center(
                            //       child: Text(
                            //         'Decline',
                            //         style: TextStyle(color: Colors.white),
                            //       ),
                            //     ),
                            //   ),
                            // ),
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
    );
  }
}
