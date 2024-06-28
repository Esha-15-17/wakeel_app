import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakeel_app/Constant.dart';
import 'package:wakeel_app/booking.dart';
import 'package:wakeel_app/splash_screen.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'package:wakeel_app/find_lawyer.dart';
import 'package:wakeel_app/signup_lawyer.dart';
import 'package:wakeel_app/menu.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Import the intl package for date/time formatting

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Select Date'),
              const SizedBox(height: 10),
              _buildDateButton(context),
              const SizedBox(height: 20),
              _buildSectionHeader('Select Time'),
              const SizedBox(height: 10),
              _buildTimeButton(context),
              const SizedBox(height: 20),
              _buildSectionHeader('Select Package'),
              const SizedBox(height: 10),
              _buildPackageList(),
              const SizedBox(height: 20),
              Center(
                child: _buildBookButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(Constants.App_green_color),
      ),
    );
  }

  Widget _buildDateButton(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(Icons.calendar_today, color: Color(Constants.App_green_color)),
        title: Text(
          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          style: TextStyle(color: Color(Constants.App_green_color)),
        ),
        trailing: Icon(Icons.edit, color: Color(Constants.App_green_color)),
        onTap: () => _selectDate(context),
      ),
    );
  }

  Widget _buildTimeButton(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(Icons.access_time, color: Color(Constants.App_green_color)),
        title: Text(
          selectedTime.format(context),
          style: TextStyle(color: Color(Constants.App_green_color)),
        ),
        trailing: Icon(Icons.edit, color: Color(Constants.App_green_color)),
        onTap: () => _selectTime(context),
      ),
    );
  }

  Widget _buildPackageList() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: packages.length,
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
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: selectedPackageId == item['id'].toString()
                      ? const Color(Constants.App_green_color)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(Constants.App_green_color),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['package_name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectedPackageId == item['id'].toString()
                              ? Colors.white
                              : const Color(Constants.App_green_color),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Price: ${item['price']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: selectedPackageId == item['id'].toString()
                              ? Colors.white
                              : const Color(Constants.App_green_color),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Duration: ${item['meeting_duration']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: selectedPackageId == item['id'].toString()
                              ? Colors.white
                              : const Color(Constants.App_green_color),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Type: ${item['meeting_type']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: selectedPackageId == item['id'].toString()
                              ? Colors.white
                              : const Color(Constants.App_green_color),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle booking logic here
        bookAppointment();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(Constants.App_green_color),
        // Change background color here
        padding: const EdgeInsets.symmetric(
            vertical: 12.0, horizontal: 40), // Adjust padding as needed
      ),
      child: const Text(
        'Book Appointment',
        style: TextStyle(
          fontSize: 18.0,
          color: Color(Constants.App_yellow_color),
        ),
      ),
    );
  }
}
