import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wakeel_app/BookingScreen.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/booking.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'find_lawyer.dart';
import 'signup_lawyer.dart';
import 'menu.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {
  final String lawyerId;

  ProfileScreen({Key? key, required this.lawyerId}) : super(key: key);

  Future<Map<String, dynamic>> _fetchLawyerProfile() async {
    // Replace with your API URL
    final url = Uri.parse(
        '${Constants.API_URL}/profile/findLawyerById?lawyer_id=$lawyerId');

    // Perform API request
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load lawyer profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchLawyerProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data available'));
        }

        final lawyer = snapshot.data!['lawyer'];

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: WakeelAppBar(back: true),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 90,
                  child: Row(
                    children: [
                      const SizedBox(width: 50),
                      Image.asset('assests/male.PNG'),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lawyer['name'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(lawyer['court']),
                          Text('${lawyer['experience']} Years'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BookingScreen(lawyerId: lawyerId,)));
                  },
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 29, 86, 31),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Proceed To Booking',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 30),
                    Text(
                      'About',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(lawyer['about_me'], textAlign: TextAlign.left),
                // email
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28),
                    const Expanded(
                      child: Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Text(lawyer['email'])),
                  ],
                ),

                //gender
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28),
                    const Expanded(
                      child: Text(
                        'Gender',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Text(lawyer['gender'])),
                  ],
                ),

// court
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28),
                    const Expanded(
                      child: Text(
                        'Court',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Text(lawyer['court'])),
                  ],
                ),
                //lang
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28),
                    const Expanded(
                      child: Text(
                        'Languages',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Text(lawyer['languages_spoken'])),
                  ],
                ),

                //residential_area
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28),
                    const Expanded(
                      child: Text(
                        'Area',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Text(lawyer['residential_area'])),
                  ],
                ),
                // zip
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 28),
                    const Expanded(
                      child: Text(
                        'Zip',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Text(lawyer['zip_code'])),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
