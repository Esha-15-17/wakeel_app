import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/profile_screen.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class SpecializationLawyers extends StatelessWidget {
  final String specialization;

  SpecializationLawyers({Key? key, required this.specialization}) : super(key: key);

  Future<List<dynamic>> _fetchLawyersBySpecialization() async {

    final url = Uri.parse('${Constants.API_URL}/getLawyerBySpecialization?specialization=$specialization');
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
      return jsonDecode(response.body)['lawyers'];
    } else {
      throw Exception('Failed to load lawyers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _fetchLawyersBySpecialization(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No lawyers found for this specialization'));
        }

        final lawyers = snapshot.data!;

        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: WakeelAppBar(back: true),
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
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: lawyers.length,
                    itemBuilder: (context, index) {
                      final lawyer = lawyers[index];
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
                                        const SizedBox(height: 2),
                                        Image.asset(
                                          (lawyer['gender'] == "female")
                                              ? 'assests/female.PNG'
                                              : 'assests/male.PNG',
                                          height: 65,
                                          width: 65,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          lawyer['name'],
                                          style: const TextStyle(
                                            color: Color(0xFFCA9D3E),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 40),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Court',
                                            style: TextStyle(
                                              color: Color(0xFF01411C),
                                            ),
                                          ),
                                          Text(
                                            'Experience',
                                            style: TextStyle(
                                              color: Color(0xFF01411C),
                                            ),
                                          ),
                                          Text(
                                            'Area',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Color(0xFF01411C),
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
                                            lawyer['court'],
                                            style: const TextStyle(
                                              color: Color(0xFF01411C),
                                            ),
                                          ),
                                          Text(
                                            lawyer['experience'],
                                            style: const TextStyle(
                                              color: Color(0xFF01411C),
                                            ),
                                          ),
                                          Text(
                                            lawyer['residential_area'],
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
                                              builder: (context) => ProfileScreen(lawyerId: lawyer['id'].toString()),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFCA9D3E),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: const Center(child: Text('View Profile')),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Container(
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
                                    ],
                                  ),
                                ),
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
      },
    );
  }
}
