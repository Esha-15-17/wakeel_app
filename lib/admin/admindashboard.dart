import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart'; // Ensure Constant is defined with the correct API URL
import 'package:wakeel_app/wakeel_app_bar.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> lawyers = [];
  List<Map<String, dynamic>> filteredLawyers = [];
  List<dynamic> feedbacks = [];
  List<dynamic> contactMessages = [];
  int _selectedIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fetchLawyers();
    fetchFeedbacks();
    fetchContactMessages();
    searchController.addListener(_filterLawyers);
    _timer = Timer.periodic(Duration(seconds: 30), (Timer t) => fetchFeedbacks()); // Refresh feedbacks every 30 seconds
  }

  @override
  void dispose() {
    searchController.removeListener(_filterLawyers);
    searchController.dispose();
    _timer?.cancel(); // Cancel the timer when the widget is disposed to prevent memory leaks
    super.dispose();
  }

  Future<void> fetchLawyers({String search = ''}) async {
    final url = Uri.parse('${Constants.API_URL}/admin/getAllLawyers');

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
      final List<Map<String, dynamic>> loadedLawyers = [];
      for (var lawyer in data['lawyers']) {
        loadedLawyers.add({
          'id': lawyer['id'].toString(),
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
          'lawyer_status': lawyer['lawyer_status'] ?? 'inactive', // Add status to each lawyer
        });
      }
      setState(() {
        lawyers = loadedLawyers;
        filteredLawyers = loadedLawyers;
      });
    } else {
      throw Exception('Failed to load lawyers');
    }
  }

  Future<void> fetchFeedbacks() async {
    final url = Uri.parse('${Constants.API_URL}/admin/getFeedbacks');

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
      try {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> feedbackData = responseData['feedbacks'] ?? []; // Adjust the key based on your API response
        setState(() {
          feedbacks = feedbackData;
        });
      } catch (e) {
        print('Failed to parse feedbacks: $e');
      }
    } else {
      print('Failed to fetch feedbacks');
    }
  }

  Future<void> fetchContactMessages() async {
    final url = Uri.parse('${Constants.API_URL}/admin/getAllContactQueries');

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
      setState(() {
        contactMessages = jsonDecode(response.body);
      });
    } else {
      print('Failed to fetch contact messages');
    }
  }

  Future<void> updateLawyerStatus(String id, String status) async {
    final url = Uri.parse('${Constants.API_URL}/admin/update-lawyer-status');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'id': id,
        'status': status,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        for (var lawyer in lawyers) {
          if (lawyer['id'] == id) {
            lawyer['lawyer_status'] = status;
          }
        }
        _filterLawyers(); // Update the filtered list
      });
    } else {
      print('Failed to update lawyer status: ${response.statusCode}');
    }
  }

  void _filterLawyers() {
    String query = searchController.text.toLowerCase();
    // fetchLawyers(search: query);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search Lawyer by Name, Specialization, or Residential Area',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.search, color: Color(0xff01411C)),
              ),
            ),
            SizedBox(height: 20),
            Text('Lawyers:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff01411C))),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLawyers.length,
                itemBuilder: (context, index) {
                  final lawyer = filteredLawyers[index];
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
                              Text(
                                lawyer['lawyer_status'],
                                style: TextStyle(
                                  color: lawyer['lawyer_status'] == 'active' ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
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
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () => updateLawyerStatus(lawyer['id'], 'active'),
                                      child: Container(
                                        height: 25,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Activate',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () => updateLawyerStatus(lawyer['id'], 'inactive'),
                                      child: Container(
                                        height: 25,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Deactivate',
                                            style: TextStyle(color: Colors.white),
                                          ),
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
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Client Feedbacks:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff01411C))),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: feedbacks.length,
                itemBuilder: (context, index) {
                  final feedback = feedbacks[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text('Lawyer ID: ${feedback['lawyer_id']}', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(feedback['remarks']),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact Messages:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff01411C))),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: contactMessages.length,
                itemBuilder: (context, index) {
                  final message = contactMessages[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text('Subject: ${message['subject']}', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(message['message']),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: false),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _buildBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Lawyers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedbacks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact Messages',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff01411C),
        onTap: _onItemTapped,
      ),
    );
  }
}
