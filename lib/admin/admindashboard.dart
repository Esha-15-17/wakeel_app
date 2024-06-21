import 'package:flutter/material.dart';
import 'package:wakeel_app/admin/contactquries.dart';
import 'package:wakeel_app/admin/manageservices.dart';

import 'package:wakeel_app/admin/manageuserscreen.dart';
import 'package:wakeel_app/admin/packages.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: InkWell(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageUsersScreen(),
                  ));
            },child: Text('Manage Users')),
            onTap: () {
              Navigator.pushNamed(context, '/manage_users');
            },
          ),
          ListTile(
            title: InkWell(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagePackagesScreen(),
                  ));
            },child: Text('Manage Packages')),
            onTap: () {
              Navigator.pushNamed(context, '/manage_packages');
            },
          ),
          ListTile(
            title: InkWell(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageServicesScreen(),
                  ));
            },child: Text('Manage Services')),
            onTap: () {
              Navigator.pushNamed(context, '/manage_services');
            },
          ),
          ListTile(
            title: InkWell(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactQueriesScreen(),
                  ));
            },child: Text('Contact Queries')),
            onTap: () {
              Navigator.pushNamed(context, '/contact_queries');
            },
          ),
        ],
      ),
    );
  }
}
