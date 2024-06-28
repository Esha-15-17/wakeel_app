import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wakeel_app/BookingScreen.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

import 'feedback.dart';

class ProfileScreen extends StatelessWidget {
  final String lawyerId;

  ProfileScreen({Key? key, required this.lawyerId}) : super(key: key);

  Future<Map<String, dynamic>> _fetchLawyerProfile() async {
    final url = Uri.parse('${Constants.API_URL}/profile/findLawyerById?lawyer_id=$lawyerId');
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
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assests/male.PNG'),
                ),
                const SizedBox(height: 10),
                Text(
                  lawyer['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  '${lawyer['experience']} Years at ${lawyer['court']}',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(lawyerId: lawyerId)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(Constants.App_green_color),
                    foregroundColor: const Color(Constants.App_yellow_color),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Proceed To Booking'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackForm(lawyerId: lawyerId), // Pass lawyerId to the feedback form
                        )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCA9D3E),  // A distinct color for feedback
                    foregroundColor: const Color(Constants.App_yellow_color),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Give Feedback'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(lawyer['about_me'], textAlign: TextAlign.left),
                      ProfileInfoRow(title: 'Email', value: lawyer['email']),
                      ProfileInfoRow(title: 'Gender', value: lawyer['gender']),
                      ProfileInfoRow(title: 'Court', value: lawyer['court']),
                      ProfileInfoRow(title: 'Languages', value: lawyer['languages_spoken']),
                      ProfileInfoRow(title: 'Area', value: lawyer['residential_area']),
                      ProfileInfoRow(title: 'Zip', value: lawyer['zip_code']),
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
}

class ProfileInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfoRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
