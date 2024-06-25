import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wakeel_app/Lawyer/Dashboard.dart';
import 'package:wakeel_app/signup_lawyer.dart';
import 'log_inScreen.dart';
import 'client_lawyer.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'log_inScreen.dart';
import 'profile_screen.dart';
import 'log_inScreen.dart';
import 'legal_sevices.dart';
import 'Constant.dart';
import 'package:image_picker/image_picker.dart';
import 'verify_email.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

class lawyerprofile extends StatefulWidget {
  const lawyerprofile({Key? key, required String userRole}) : super(key: key);

  @override
  State<lawyerprofile> createState() => _lawyerprofileState();
}

class _lawyerprofileState extends State<lawyerprofile> {
  TextEditingController genderController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController residentialareaController = TextEditingController();
  TextEditingController aboutmeController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController selectedSpecializationController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  String _selectedUserRole = 'lawyer'; // Default selected role
  File? _selectedImage;
  List<String> selectedSpecializations = [];
  String _selectedGender = ''; // To store the selected gender

  // Define gender avatars
  Map<String, String> genderAvatars = {
    'Male': 'assests/male.png', // Replace with your male avatar path
    'Female': 'assests/female.png', // Replace with your female avatar path
  };


  Future<void> registerUser(
      String gender,
      String language,
      String residentialarea,
      String aboutme,
      String experience,
      String zipcode,
      String court,
      String selectedSpecializations,
      String userRole,
      _selectedImage,

      ) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${Constants.API_URL}/profile/updateprofile'),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'multipart/form-data';
      request.fields.addAll({
        'gender': gender,
        'languages_spoken': language,
        'residential_area': residentialarea,
        'about_me': aboutme,
        'experience': experience,
        'zip_code': zipcode,
        'court': court,
        'frontend_specializations[]': selectedSpecializations,
      });

      // Check if _selectedImage is not null and it's a File
      if (_selectedImage != null && _selectedImage is File) {
        String fileExtension = _selectedImage.path.split('.').last.toLowerCase();
        if (fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'png') {
          // Add the image file to the request
          final file = await http.MultipartFile.fromPath(
            'profile_picture',
            _selectedImage.path,
            filename: 'profile_image.jpg',
          );
          request.files.add(file);
        }
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Update successful');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {
        print('Update failed: ${response.reasonPhrase}');
        print('Response: ${await response.stream.bytesToString()}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text('Please update profile before getting login.'),

              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      _selectedImage = File(image.path);
                    });
                  }
                },
                child: Container( // Wrap the child widgets with a Container
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (_selectedImage != null)
                        _selectedImage is File // Check if it's a File
                            ? ClipOval(
                          child: Image.file(
                            _selectedImage!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Image.network( // Use Image.network for web
                          _selectedImage!.path,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      if (_selectedGender.isNotEmpty)
                        Image.asset(
                          genderAvatars[_selectedGender] ?? '',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15, width: 50),
              Text(
                'Upload your image',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff01411C)),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              SizedBox(height: 20),
              // Display the selected gender's avatar

              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: genderController,
                    style: const TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        hintText: 'Gender',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Color(0xff01411C), width: 2.0)),
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: languageController,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        hintText: 'Spoken Language',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Color(0xff01411C), width: 2.0)),
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: residentialareaController,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        hintText: 'Residential Area',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Color(0xff01411C), width: 2.0)),
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
              ),
              SizedBox(
                height: 20,
              ), Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: experienceController,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        hintText: 'Experience',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Color(0xff01411C), width: 2.0)),
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: zipcodeController,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        hintText: 'Zipcode Area',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Color(0xff01411C), width: 2.0)),
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: courtController,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        hintText: 'Court',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Color(0xff01411C), width: 2.0)),
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: aboutmeController,
                    style: TextStyle(color: Color(0xff01411C)),
                    decoration: InputDecoration(
                        hintText: 'About me',
                        focusColor: Color(0xff01411C),
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide: BorderSide(
                                color: Color(0xff01411C), width: 2.0)),
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
              ),
              SizedBox(
                height: 20,
              ), Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      'Specialization',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff01411C),
                      ),
                    ),
                    for (String specialization in [
                      'child custody',
                      'Criminology',
                      'Property',
                      'Divorse',
                      'Child custody',
                      'Cyber crime',
                      'Taxtation',
                      'Immigration',
                    ])
                      Row(
                        children: [
                          Checkbox(
                            value: selectedSpecializations.contains(
                                specialization),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedSpecializations.add(specialization);
                                } else {
                                  selectedSpecializations.remove(
                                      specialization);
                                }
                              });
                            },
                          ),
                          Text(specialization),
                        ],
                      ),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),


              GestureDetector(
                onTap: () {
                  registerUser(
                    genderController.text.toString(),
                    languageController.text.toString(),
                    residentialareaController.text.toString(),
                    aboutmeController.text.toString(),
                    experienceController.text.toString(),
                    zipcodeController.text.toString(),
                    courtController.text.toString(),
                    selectedSpecializations.join(','),
                    _selectedUserRole,
                    _selectedImage,
                  );
                },
                child: Container(
                  height: 50,
                  width: 122,
                  decoration: BoxDecoration(
                    color: Color(0xff01411C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Update Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
