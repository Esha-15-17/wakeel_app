import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'booking.dart';
import 'schedule.dart';
import 'legal_sevices.dart';
import 'menu.dart';
import 'appointment.dart';
import 'find_lawyer.dart';
import 'package:wakeel_app/legal_sevices.dart';

class legalser extends StatelessWidget {
  const legalser({super.key});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Services',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 16), // Add some spacing between the texts
                Text(
                  'Check Bounce',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Fill in the form:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 305,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 305,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 305,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 305,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Description:',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  height: 130,
                  width: 305,
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      // Green label text color
                      focusColor: Colors.black,
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: const Color(0xff01411C), width: 2.0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(child: Text('Save')),
            ),
          ],
        ),
      ),
    ));
  }
}
