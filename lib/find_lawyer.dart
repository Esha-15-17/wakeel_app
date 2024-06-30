import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package for opening external URLs
import 'package:wakeel_app/wakeel_app_bar.dart';

import 'Constant.dart';
import 'profile_screen.dart';

class FindLawyer extends StatefulWidget {
  const FindLawyer({Key? key}) : super(key: key);

  @override
  State<FindLawyer> createState() => _FindLawyerState();
}

class _FindLawyerState extends State<FindLawyer> {
  List<Map<String, dynamic>> appointments = [];
  List<Map<String, dynamic>> filteredAppointments = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAppointments();
    searchController.addListener(_filterLawyers);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterLawyers);
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchAppointments() async {
    final url = Uri.parse('${Constants.API_URL}/showall-lawyers');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> loadedAppointments = [];
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
          'specialization': lawyer['specialization'] ?? [],
          'phone_number': lawyer['phone_number'] ?? '', // Add phone_number field
        });
      }
      setState(() {
        appointments = loadedAppointments;
        filteredAppointments = loadedAppointments;
      });
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  void _filterLawyers() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredAppointments = appointments.where((lawyer) {
        return lawyer['name'].toLowerCase().contains(query) ||
            lawyer['residential_area'].toLowerCase().contains(query) ||
            (lawyer['specialization'] as List)
                .any((spec) => spec.toLowerCase().contains(query));
      }).toList();
    });
  }

  void _launchNativeChatApp(String phoneNumber) async {
    // Replace 'whatsapp://' with the appropriate scheme for the chat app you want to open
    // String url = 'whatsapp://send?phone=$phoneNumber';
    String url = 'sms:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Find Lawyer',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
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
                itemCount: filteredAppointments.length,
                itemBuilder: (context, index) {
                  final appointment = filteredAppointments[index];
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Image.asset(
                                      (appointment['gender'] == "female")
                                          ? 'assests/female.PNG'
                                          : 'assests/male.PNG',
                                      height: 65,
                                      width: 65,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      appointment['name'],
                                      style: const TextStyle(
                                        color: Color(0xFFCA9D3E),
                                        fontWeight: FontWeight.bold,
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
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        'Experience',
                                        style: TextStyle(
                                          color: Color(0xFF01411C),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        'Area',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color(0xFF01411C),
                                          fontWeight: FontWeight.normal,
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
                                        appointment['court'],
                                        style: const TextStyle(
                                          color: Color(0xFF01411C),
                                        ),
                                      ),
                                      Text(
                                        appointment['experience'],
                                        style: const TextStyle(
                                          color: Color(0xFF01411C),
                                        ),
                                      ),
                                      Text(
                                        appointment['residential_area'],
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
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileScreen(
                                                  lawyerId:
                                                  appointment['id']),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFCA9D3E),
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                          child: Text('View Profile',
                                              style: TextStyle(
                                                  color: Color(Constants
                                                      .App_yellow_color)))),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _launchNativeChatApp(appointment[
                                      'phone_number']); // Call method to open chat app
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 19, 59, 20),
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                          child: Text(
                                            'Chat',
                                            style:
                                            TextStyle(color: Colors.white),
                                          )),
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
        ),
      ),
    );
  }
}
