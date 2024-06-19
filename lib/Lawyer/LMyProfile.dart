import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/My_profile.dart';
import 'package:provider/provider.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:animated_radio_buttons/animated_radio_buttons.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wakeel_app/BookingScreen.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class LMyProfile extends StatelessWidget {
  // final String lawyerId;
  const LMyProfile({super.key});

  // LMyProfile({Key? key, required this.lawyerId}) : super(key: key);

  Future<Map<String, dynamic>> _fetchLawyerProfile() async {
    final url = Uri.parse(
        '${Constants.API_URL}/profile/getProfile');

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

    // Perform API request
    // final response = await http.get(url);

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

        final lawyer = snapshot.data!['profile'];

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: WakeelAppBar(back: false),
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
                      lawyer['profile_picture'] != null
                          ? Image.network(lawyer['profile_picture'])
                          : Image.asset('assests/male.PNG'),
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
                const SizedBox(height: 10),
                _buildProfileRow('Email', lawyer['email']),
                const SizedBox(height: 10),
                _buildProfileRow('Gender', lawyer['gender']),
                const SizedBox(height: 10),
                _buildProfileRow('Court', lawyer['court']),
                const SizedBox(height: 10),
                _buildProfileRow('Languages', lawyer['languages_spoken']),
                const SizedBox(height: 10),
                _buildProfileRow('Area', lawyer['residential_area']),
                const SizedBox(height: 10),
                _buildProfileRow('Zip', lawyer['zip_code']),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 30),
                    Text(
                      'Specialization',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                for (var specialization in lawyer['specialization'])
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 15),
                        SizedBox(width: 5),
                        Text(specialization),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 28),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: Text(value)),
      ],
    );
  }
}
