import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:wakeel_app/Constant.dart'; // Ensure Constant is defined with the correct API URL

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> lawyers = [];
  List<Map<String, dynamic>> filteredLawyers = [];
  List<dynamic> feedbacks = [];
  int _selectedIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fetchLawyers();
    fetchFeedbacks();
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

  Future<void> fetchLawyers() async {
    final url = Uri.parse('${Constants.API_URL}/showall-lawyers');
    final response = await http.get(url);

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
    final response = await http.get(Uri.parse('https://dfdb-103-26-82-138.ngrok-free.app/admin/getFeedbacks'));

    if (response.statusCode == 200) {
      setState(() {
        feedbacks = jsonDecode(response.body);
      });
    } else {
      print('Failed to fetch feedbacks');
    }
  }

  Future<void> deleteLawyerProfile(String id) async {
    final url = Uri.parse('${Constants.API_URL}/delete-lawyer');
    final response = await http.post(url, body: {'id': id});

    if (response.statusCode == 200) {
      setState(() {
        lawyers.removeWhere((lawyer) => lawyer['id'] == id);
        filteredLawyers.removeWhere((lawyer) => lawyer['id'] == id);
      });
    } else {
      throw Exception('Failed to delete lawyer profile');
    }
  }

  void _filterLawyers() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredLawyers = lawyers.where((lawyer) {
        return lawyer['name'].toLowerCase().contains(query) ||
            lawyer['residential_area'].toLowerCase().contains(query) ||
            (lawyer['specialization'] as List)
                .any((spec) => spec.toLowerCase().contains(query));
      }).toList();
    });
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
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () => deleteLawyerProfile(lawyer['id']),
                                    child: Container(
                                      height: 25,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Delete Profile',
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
                      subtitle: Text(feedback['comment']),
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
      appBar: AppBar(
        title: Text('Admin Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xff01411C),
        centerTitle: true,
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff01411C),
        onTap: _onItemTapped,
      ),
    );
  }
}
