
import 'package:flutter/material.dart';

import 'package:wakeel_app/chatwidget.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'reviews_screen.dart';
import 'chatt.dart';
import 'booking.dart';
import 'appointment.dart';
import 'find_lawyer.dart';
import 'menu.dart';
import 'legal_sevices.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back),
                Text('Adv. Bashir Momin'),
                Icon(Icons.more_vert),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Chat(
                text: 'Hey! How are you \n going ?',
                color: Colors.green,
                topLeft: 5,
                topRight: 0,
                bottomLeft: 5,
                bottomRight: 5),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: Text('Delieverd'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Chat(
                  text: 'Hey! How are you \n going ?',
                  color: Colors.white,
                  topLeft: 5,
                  topRight: 0,
                  bottomLeft: 5,
                  bottomRight: 5),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text('Delieverd'),
            ),
            Chat(
                text: 'Hey! How are you \n going ?',
                color: Colors.green,
                topLeft: 5,
                topRight: 0,
                bottomLeft: 5,
                bottomRight: 5),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: Text('Delieverd'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Chat(
                  text: 'Hey! How are you \n going ?',
                  color: Colors.white,
                  topLeft: 5,
                  topRight: 0,
                  bottomLeft: 5,
                  bottomRight: 5),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text('Delieverd'),
            ),
            Chat(
                text: 'Hey! How are you \n going ?',
                color: Colors.green,
                topLeft: 5,
                topRight: 0,
                bottomLeft: 5,
                bottomRight: 5),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: Text('Delieverd'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Chat(
                  text: 'Hey! How are you \n going ?',
                  color: Colors.white,
                  topLeft: 5,
                  topRight: 0,
                  bottomLeft: 5,
                  bottomRight: 5),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text('Delieverd'),
            ),
            Chat(
                text: 'Hey! How are you \n going ?',
                color: Colors.green,
                topLeft: 5,
                topRight: 0,
                bottomLeft: 5,
                bottomRight: 5),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: Text('Delieverd'),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              width: 360,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Icon(Icons.camera),
                  Icon(Icons.image),
                  Icon(Icons.share),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text('Write your message here...  '),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 25),
                  ),
                  const Icon(Icons.mic),
                  InkWell(
                    onTap: () {
                      Navigator.push
                        (context,
                          MaterialPageRoute(
                              builder: (context) => RecentMessages()));
                    },
                    child: Container(
                      height: 25,
                      width: 35,
                      child: Center(child: Text('Send')),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}