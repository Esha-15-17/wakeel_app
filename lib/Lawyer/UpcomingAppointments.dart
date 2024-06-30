import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:http/http.dart' as http;

import 'package:wakeel_app/chatwidget.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({super.key});

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  List<Map<String, dynamic>> appointments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final url = Uri.parse('${Constants.API_URL}/get-lawyer-appointments');

    try {
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
          final List<Map<String, dynamic>> loadedAppointments = [];
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
              'user_phone_number': appointment['user_phone_number'],
              'user_name': appointment['user_name'], // Add user_name
            });
          }

          setState(() {
            appointments = loadedAppointments;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load appointments');
        print(response.statusCode);
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching appointments: $error');
    }
  }

  Future<void> openChatApp(String phoneNumber) async {
    final url = 'sms:$phoneNumber'; // Using SMS URL scheme
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error: could not launch URL
      print('Could not launch $url');
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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${appointment['user_name']}',
                            style: const TextStyle(
                              color: Color(0xFF01411C),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => openChatApp(appointment['user_phone_number']),
                            child: Container(
                              height: 25,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFCA9D3E),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: Text('Chat')),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              Image.network(
                                appointment['lawyer_avatar'],
                                height: 55,
                                width: 55,
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
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
                                  textAlign: TextAlign.left,
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
                                  appointment['meeting_type'],
                                  style: const TextStyle(
                                    color: Color(0xFF01411C),
                                  ),
                                ),
                                Text(
                                  appointment['appointment_date'],
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
