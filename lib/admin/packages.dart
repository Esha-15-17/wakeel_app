import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManagePackagesScreen extends StatefulWidget {
  @override
  _ManagePackagesScreenState createState() => _ManagePackagesScreenState();
}

class _ManagePackagesScreenState extends State<ManagePackagesScreen> {
  List<dynamic> _packages = [];

  Future<void> _fetchPackages() async {
    try {
      final response = await http.get(Uri.parse('http://your-backend-url.com/admin/packages')); // Replace with your backend URL
      if (response.statusCode == 200) {
        setState(() {
          _packages = jsonDecode(response.body)['packages'];
        });
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to fetch packages. Please try again later.'),
        ));
      }
    } catch (error) {
      // Handle error
      print('Error fetching packages: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPackages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Packages'),
      ),
      body: _packages.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _packages.length,
        itemBuilder: (context, index) {
          final package = _packages[index];
          return ListTile(
            title: Text(package['package_name']),
            subtitle:
            Text('Price: ${package['price']} - Duration: ${package['meeting_duration']}'),
            // Implement actions like editing or deleting the package
            // based on your requirements
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement navigation to add new package screen
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddPackageScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
