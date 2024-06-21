import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManageUsersScreen extends StatefulWidget {
  @override
  _ManageUsersScreenState createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  List<dynamic> _users = [];

  Future<void> _fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('http://your-backend-url.com/admin/users')); // Replace with your backend URL
      if (response.statusCode == 200) {
        setState(() {
          _users = jsonDecode(response.body)['users'];
        });
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to fetch users. Please try again later.'),
        ));
      }
    } catch (error) {
      // Handle error
      print('Error fetching users: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Users'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Text(user['email']),
            // Implement actions like editing or deleting the user
            // based on your requirements
          );
        },
      ),
    );
  }
}
