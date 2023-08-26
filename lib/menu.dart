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
        backgroundColor: Color.fromARGB(255, 20, 74, 22),
        title: SingleChildScrollView(
          child:
              Row(
                children: [
                  Text('Menu')
                ],
              ),


        ),
      ),
      body: SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        InkWell(onTap: () {
          Navigator.push
            (context,
              MaterialPageRoute(
                  builder: (context) => myprofile()));
        },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person
              ),
              Text(
                  'My profile',
                  style: TextStyle(fontSize: 15),
                ),

              SizedBox(
                width: 248,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(onTap: () {
          Navigator.push
            (context,
              MaterialPageRoute(
                  builder: (context) => resetpassword()));
        },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  Icons.password
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Reset Password',
                style: TextStyle(fontSize: 15),
              ),

              SizedBox(
                width: 205,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(Icons.laptop_chromebook_outlined),
            Text(
              'My Booking',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: 240,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 15,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),

        InkWell(
          onTap: () {
            Navigator.push
              (context,
                MaterialPageRoute(
                    builder: (context) => changednum()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(

                Icons.numbers
              ),
               Text(
                  'Change number',
                  style: TextStyle(fontSize: 15),
                ),

              SizedBox(
                width: 215,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                Icons.notifications
            ),
            InkWell(
              onTap: () {
                Navigator.push
                  (context,
                    MaterialPageRoute(
                        builder: (context) => Notifications()));
              },
              child: Text(
                'Notification',
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              width: 240,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 15,
            ),
          ],
        ),

        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ));
              },
              child: Icon(
                  Icons.message_rounded
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ));
              },
              child: Text(
                'Messages',
                style: TextStyle(fontSize: 15),
              ),
            ),

            SizedBox(
              width: 248,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 15,
            ),
          ],
        ),
        SizedBox(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(Icons.contact_page),
              Text(
                'contact us',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 248,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                Icons.share
            ),
            Text(
              'Share App',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: 248,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 15,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(Icons.fork_right),
            Text(
              'Referral your friends',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: 184,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 15,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(Icons.wallet),
            SizedBox(
              width: 5,
            ),
            Text(
              'wallet',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: 272,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 15,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ]
    ),
    ),
    );

  }
}