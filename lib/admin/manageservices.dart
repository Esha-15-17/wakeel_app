import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManageServicesScreen extends StatefulWidget {
  @override
  _ManageServicesScreenState createState() => _ManageServicesScreenState();
}

class _ManageServicesScreenState extends State<ManageServicesScreen> {
  List<dynamic> _services = [];

  Future<void> _fetchServices() async {
    try {
      final response = await http.get(Uri.parse('http://your-backend-url.com/admin/services')); // Replace with your backend URL
      if (response.statusCode == 200) {
        setState(() {
          _services = jsonDecode(response.body)['services'];
        });
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to fetch services. Please try again later.'),
        ));
      }
    } catch (error) {
      // Handle error
      print('Error fetching services: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Services'),
      ),
      body: _services.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _services.length,
        itemBuilder: (context, index) {
          final service = _services[index];
          return ListTile(
            title: Text(service['name']),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(service['icon']),
            ),
            // Implement actions like editing or deleting the service
            // based on your requirements
          );
        },
      ),
    );
  }
}
