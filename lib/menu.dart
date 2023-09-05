import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wakeel_app/menu.dart';
import 'profile_screen.dart';
import 'changed_num.dart';
import 'My_profile.dart';
import 'chatwidget.dart';
import 'notfications_screen.dart';
import 'legal_sevices.dart';
import 'contactus.dart';
import 'reset_password.dart';
import 'changed_num.dart';

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 20, 74, 22),
        title: const SingleChildScrollView(
          child: Row(
            children: [Text('Menu')],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => myprofile()));
            },
            child: const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.person),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'My profile',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => resetpassword()));
            },
            child: const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.password),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(Icons.laptop_chromebook_outlined),
              SizedBox(
                width: 20,
              ),
              Text(
                'My Booking',
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => changednum()));
            },
            child: const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.numbers),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Change number',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
            child: const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.notifications),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Notification',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            child: const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.message_rounded),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Messages',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ));
            },
            child: const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.contact_page),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'contact us',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          InkWell(
            onTap: () {},
            child: const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.share),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Share App',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(Icons.fork_right),
              SizedBox(
                width: 20,
              ),
              Text(
                'Referral your friends',
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(Icons.wallet),
              SizedBox(
                width: 20,
              ),
              Text(
                'wallet',
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
