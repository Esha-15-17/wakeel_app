import 'package:flutter/material.dart';
import 'package:wakeel_app/Constant.dart';

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
  final List<Map<String, String>> list = [
    {
      'msg': 'Hey! How are you \n going ?',
      'status': 'Delivered', // seen // sent
      'type': 'sender',
    },
    {
      'msg': 'Hey! How are you \n going ?',
      'status': 'Delivered', // seen // sent
      'type': 'receiver',
    },
    {
      'msg': 'Hey! How are you \n going ?',
      'status': 'Delivered', // seen // sent
      'type': 'sender',
    },
    {
      'msg': 'Hey! How are you \n going ?',
      'status': 'Delivered', // seen // sent
      'type': 'sender',
    },
    {
      'msg': 'Hey! How are you \n going ?',
      'status': 'Delivered', // seen // sent
      'type': 'receiver',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: true),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Color(Constants.App_green_color)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text('Adv. Bashir Momin',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(Constants.App_txt_color))),
              IconButton(
                icon: const Icon(Icons.more_vert,
                    color: Color(Constants.App_green_color)),
                onPressed: () {
                  // Navigator.pop(context);
                },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length, // Adjust the number of items as needed
              itemBuilder: (context, index) {
                final item = list[index];

                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Chat(
                            textColor: Constants.App_yellow_color,
                            text: item["msg"]!,
                            type: item["type"]!,
                          ),
                        ),
                        item["type"] == "sender"
                            ? const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text('Delieverd',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color(Constants.App_txt_color))),
                                ),
                              )
                            : const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text('Delieverd',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color(Constants.App_txt_color))),
                                ),
                              )
                      ],
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.camera),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.image),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.share),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '|',
                    style: TextStyle(fontSize: 25),
                  ),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(color: Color(Constants.App_txt_color)),
                      decoration: InputDecoration(
                        hintText: 'Write your message here...',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => RecentMessages()));
                    },
                    child: Container(
                        height: 30,
                        width: 77,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color(Constants.App_green_color)),
                        child: const Center(
                            child: Text('Send',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Color(Constants.App_yellow_color))))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
