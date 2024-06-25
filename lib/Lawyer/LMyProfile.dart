import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LMyProfile extends StatelessWidget {
  const LMyProfile({super.key});

  Future<Map<String, dynamic>> _fetchLawyerProfile() async {
    final url = Uri.parse('${Constants.API_URL}/profile/getProfile');

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
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: lawyer['profile_picture'] != null
                      ? NetworkImage(lawyer['profile_picture'])
                      : AssetImage('assests/male.PNG') as ImageProvider,
                ),
                const SizedBox(height: 20),
                Text(
                  lawyer['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  lawyer['court'],
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  '${lawyer['experience']} Years Experience',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(lawyer['about_me'], style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                _buildProfileSection('Email', lawyer['email']),
                _buildProfileSection('Gender', lawyer['gender']),
                _buildProfileSection('Court', lawyer['court']),
                _buildProfileSection('Languages', lawyer['languages_spoken']),
                _buildProfileSection('Area', lawyer['residential_area']),
                _buildProfileSection('Zip', lawyer['zip_code']),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Specialization',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      for (var specialization in lawyer['specialization'])
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(Icons.star, size: 20, color: Colors.amber),
                              const SizedBox(width: 10),
                              Text(specialization, style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
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

  Widget _buildProfileSection(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
