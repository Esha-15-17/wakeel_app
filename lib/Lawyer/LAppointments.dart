import 'package:flutter/material.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/Lawyer/EmergencyAppointments.dart';
import 'package:wakeel_app/Lawyer/HistoryAppointments.dart';
import 'package:wakeel_app/Lawyer/NewAppointments.dart';
import 'package:wakeel_app/Lawyer/UpcomingAppointments.dart';

import 'package:wakeel_app/chatwidget.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';


class LAppointments extends StatefulWidget {
  const LAppointments({super.key});

  @override
  State<LAppointments> createState() => _LAppointmentsState();
}

class _LAppointmentsState extends State<LAppointments> {
  int _tabIndex = 0;

  final List<Widget> tabList = [
    const UpcomingAppointments(),
    const HistoryAppointments(),

  ];

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: WakeelAppBar(back: false),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _tabIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/book.png', height: 40, width: 40),
                        const SizedBox(height: 8), // Adding space of 8 pixels between the image and text
                        const Text(
                          'Upcoming',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _tabIndex = 1;
                      });
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => legalser()));
                    },
                    child: Column(
                      children: [
                        Image.asset('assests/app.png', height: 40, width: 40),
                        const SizedBox(height: 8), // Adding space of 8 pixels between the image and text
                        const Text(
                          'History',
                          textAlign: TextAlign
                              .center, // Optional: Align text within its container
                        ),
                      ],
                    ),
                  ),
                ),

              ]),
            ),
            const SizedBox(height: 10), // Adding space of 8 pixels between the image and text
            Expanded(
              child: Container(
                child: tabList[_tabIndex],
              ),
            ),

          ]),

        ));

  }
}
