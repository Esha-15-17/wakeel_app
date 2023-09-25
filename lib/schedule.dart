import 'package:flutter/material.dart';
import 'package:wakeel_app/ScheduleListScreen.dart';
import 'package:wakeel_app/schedule.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'legal_sevices.dart';
import 'schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  ScheduleScreenState createState() => ScheduleScreenState();
}

class ScheduleScreenState extends State<ScheduleScreen> {
  int type = 1;

  void setType(int mType) {
    setState(() {
      type = mType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Schedule', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF01411C),
                      onPrimary: Color(0xFF3D3D3D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the button's border radius
                      ),
                    ),
                    onPressed: () {
                      setType(1);
                    },
                    child: const Text(
                      'Ongoing',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    )),
                SizedBox(
                  width: 1,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFCA9D3E),
                      onPrimary: Color(0xFF3D3D3D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the button's border radius
                      ),
                    ),
                    onPressed: () {
                      setType(2);
                    },
                    child: const Text(
                      'Completed',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    )),
                SizedBox(
                  width: 1,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFD9D9D9),
                      onPrimary: Color(0xFF3D3D3D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the button's border radius
                      ),
                    ),
                    onPressed: () {
                      setType(3);
                    },
                    child: const Text(
                      'Canceled',
                      style: TextStyle(
                        color:
                            Color(0xFF3D3D3D), // Set the text color to #3D3D3D
                        fontSize: 16, // Set the font size
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.amber,
                ),
                child: ScheduleListScreen(type: type)),
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
        )
    );
  }
}
