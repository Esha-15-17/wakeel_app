import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactQueriesScreen extends StatefulWidget {
  @override
  _ContactQueriesScreenState createState() => _ContactQueriesScreenState();
}

class _ContactQueriesScreenState extends State<ContactQueriesScreen> {
  List<dynamic> _queries = [];

  Future<void> _fetchContactQueries() async {
    try {
      final response = await http.get(Uri.parse('http://your-backend-url.com/admin/contact_queries')); // Replace with your backend URL
      if (response.statusCode == 200) {
        setState(() {
          _queries = jsonDecode(response.body);
        });
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to fetch contact queries. Please try again later.'),
        ));
      }
    } catch (error) {
      // Handle error
      print('Error fetching contact queries: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchContactQueries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Queries'),
      ),
      body: _queries.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _queries.length,
        itemBuilder: (context, index) {
          final query = _queries[index];
          return ListTile(
            title: Text(query['subject']),
            subtitle: Text(query['message']),
            // Implement actions like viewing details or responding to the query
            // based on your requirements
          );
        },
      ),
    );
  }
}
