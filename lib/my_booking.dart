import 'package:flutter/material.dart';
import 'package:wakeel_app/my_booking.dart';
import 'schedule.dart';
import 'appointment.dart';
import 'booking.dart';
import 'legal_sevices.dart';


class BookEmergency extends StatelessWidget {
  const BookEmergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 107, 40),
        title: Row(
          children: [
            SizedBox(
              width: 70,
            ),
            SizedBox(width: 100, child: Image.asset('assests/Frame2.png')),
            SizedBox(
              width: 50,
            ),
            Icon(Icons.search),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScheduleScreen()));
                },
                child: Icon(Icons.settings)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Color(0xff01411C)),
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    suffixIcon: Icon(Icons.pin_drop),
                    focusColor: Color(0xff01411C),
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                        BorderSide(color: Color(0xff01411C), width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            color: const Color(0xff01411C), width: 2.0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 150,
              child: Center(
                  child: Text(
                    'Compose',
                    style: TextStyle(color: Colors.white),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 20, 77, 22),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Booking History',style:TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cheque Bounce',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('23 March 2023'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('07 Approached ',style: TextStyle(color: Colors.blueGrey),),
                          Text(' | '),
                          Text(' 28 Impressions',style: TextStyle(color: Colors.blueGrey),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text('Lorem ipsum has been the industry standard \ndummy text ever since the 1500s..')],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Solved By',style: TextStyle(color: Colors.blueGrey),),
                          Text('Adv Javaid Iqbal',style: TextStyle(color: Colors.blueGrey),),
                          Container(
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text(
                                'View Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 32, 112, 35),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cheque Bounce',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('23 March 2023'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('07 Approached ',style: TextStyle(color: Colors.blueGrey),),
                          Text(' | '),
                          Text(' 28 Impressions',style: TextStyle(color: Colors.blueGrey),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text('Lorem ipsum has been the industry standard \ndummy text ever since the 1500s..')],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Solved By',style: TextStyle(color: Colors.blueGrey),),
                          Text('Adv Javaid Iqbal',style: TextStyle(color: Colors.blueGrey),),
                          Container(
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text(
                                'View Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 32, 112, 35),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cheque Bounce',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('23 March 2023'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('07 Approached ',style: TextStyle(color: Colors.blueGrey),),
                          Text(' | '),
                          Text(' 28 Impressions',style: TextStyle(color: Colors.blueGrey),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text('Lorem ipsum has been the industry standard \ndummy text ever since the 1500s..')],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Solved By',style: TextStyle(color: Colors.blueGrey),),
                          Text('Adv Javaid Iqbal',style: TextStyle(color: Colors.blueGrey),),
                          Container(
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text(
                                'View Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 32, 112, 35),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}