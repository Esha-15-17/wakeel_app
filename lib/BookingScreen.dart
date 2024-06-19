import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/booking.dart';
import 'package:wakeel_app/splash_screen.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'find_lawyer.dart';
import 'signup_lawyer.dart';
import 'menu.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Import the intl package for date/time formatting

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingScreen extends StatefulWidget {
  final String lawyerId;

  const BookingScreen({Key? key, required this.lawyerId}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late List<Map<String, dynamic>> packages = [];
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  String selectedPackageId = ""; // Default value indicating no package selected

  @override
  void initState() {
    super.initState();
    fetchPackages(); // Fetch packages when screen initializes
    selectedDate = DateTime.now(); // Initialize selected date to current date
    selectedTime = TimeOfDay.now(); // Initialize selected time to current time
  }

  Future<void> fetchPackages() async {
    // Replace with your API URL
    final url = Uri.parse('${Constants.API_URL}/showallpackages');
    print("packages");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          packages = List<Map<String, dynamic>>.from(jsonData['packages']);

          print(packages);
        });
      } else {
        throw Exception('Failed to load packages');
      }
    } catch (error) {
      print('Error fetching packages: $error');
      // Handle error as needed
    }
  }

  Future<void> bookAppointment() async {
    if (selectedPackageId == "") {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Package Required'),
          content: Text('Please select a package before booking.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    print("before");
    String formattedTime = DateFormat('HH:mm:ss').format(
      DateTime(2020, 1, 1, selectedTime.hour, selectedTime.minute),
    );
    print("formattedTime");
    print(formattedTime);

    // Replace with your API URL
    final url = Uri.parse('${Constants.API_URL}/book-appointment');

    final requestBody = {
      'lawyer_id': widget.lawyerId,
      'appointment_date': selectedDate.toString().substring(0, 10),
      // Format YYYY-MM-DD
      'appointment_time': formattedTime,
      // Format HH:MM:SS
      'package_id': selectedPackageId,
    };
  print(requestBody);

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      print(token);
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'lawyer_id': widget.lawyerId,
          'appointment_date': selectedDate.toString().substring(0, 10),
          // Format YYYY-MM-DD
          'appointment_time': formattedTime,
          // Format HH:MM:SS
          'package_id': selectedPackageId,
        }),
      );

      if (response.statusCode == 200) {
        // Handle success as needed
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Appointment Booked'),
            content: const Text('Your appointment has been booked successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                        (route) => false,
                  );
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        throw Exception('Failed to book appointment');
      }
    } catch (error) {
      print('Error booking appointment: $error');
      // Handle error as needed
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Date'),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(Constants.App_green_color),
                // Change background color here
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20), // Adjust padding as needed
              ),
              onPressed: () => _selectDate(context),
              child: Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: const TextStyle(
                      color: Color(Constants.App_yellow_color))),
            ),
            SizedBox(height: 20),
            Text('Select Time'),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(Constants.App_green_color),
                // Change background color here
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20), // Adjust padding as needed
              ),
              onPressed: () => _selectTime(context),
              child: Text(selectedTime.format(context),
                  style: const TextStyle(
                      color: Color(Constants.App_yellow_color))),
            ),
            const SizedBox(height: 20),
            const Text('Select Package' , style: TextStyle(
                color: Color(Constants.App_green_txt_color), )),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                // Adjust the number of items as needed
                itemBuilder: (context, index) {
                  final item = packages[index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedPackageId = item['id'].toString();
                            });
                          },
                          child: Row(
                            children: [
                               Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['package_name']!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color(Constants.App_txt_color)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      item['price']!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color(Constants.App_txt_color)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      item['meeting_duration']!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color:
                                          Color(Constants.App_txt_color)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      item['meeting_type']!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                          Color(Constants.App_txt_color)),
                                    )
                                  ],
                                ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          )));
                },
              ),
            ),

            Expanded(child: Container()), // Spacer
            ElevatedButton(
              onPressed: () {
                // Handle booking logic here
                bookAppointment();
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(Constants.App_green_color),
                // Change background color here
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0), // Adjust padding as needed
              ),
              child: const Center(
                  child: Text('Book Appointment',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(Constants
                              .App_yellow_color)))), // Customize text style
            ),
          ],
        ),
      ),
    );
  }
}
