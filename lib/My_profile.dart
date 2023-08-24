import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wakeel_app/My_profile.dart';
import 'package:provider/provider.dart';
import 'menu.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:animated_radio_buttons/animated_radio_buttons.dart';

class myprofile extends StatefulWidget {
  const myprofile({super.key});

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {

   int myVar = 0 ;

  @override
  Widget build(BuildContext context) {
    int _stackIndex = 0;

    String _singleValue = "Text alignment right";
    String _verticalGroupValue = "Pending";

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 20, 74, 22),
        title: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 90,
                          ),
                          Image.asset('assests/Frame2.png'),
                          SizedBox(
                            width: 79,
                          ),
                          Icon(Icons.view_headline_sharp),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
      children: [
      Container(
      height: 130,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Image.asset('assests/lawyer.PNG'),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adv. Bashir',style: TextStyle(color: Colors.yellow),
              ),
              Text('Momin'),
              Text('Defence Karachi'),
              Text('10 Years'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Me',style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    children:[
                      Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child:
                        Text('It is long established that a \nreader will be distracted.'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      color: Color.fromARGB(255, 20, 74, 22),
    ),
               SizedBox(height: 30,),
          Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('First Name:'),
              SizedBox(height: 10,),
              TextField(
            decoration: InputDecoration(
              hintText: 'Enter your name',
              ),
          ),
              SizedBox(height: 10,),
              Divider(
                thickness:2,color:Colors.black,
              ),
              SizedBox(height: 10,),
              Text('Last Name:'),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 10,),
              Divider(
                thickness:2,color:Colors.black,
              ),
              SizedBox(height: 10,),
          AnimatedRadioButtons(
          backgroundColor: Colors.white,
            value: myVar,
            layoutAxis: Axis.horizontal,
            buttonRadius: 20.0,
            items: [
              AnimatedRadioButtonItem(
                  label: "Male",
                  color: Color(0xff01411C),
                  fillInColor: Colors.amber),
              AnimatedRadioButtonItem(
                  label: "Female",
                  color: Color(0xff01411C),
                  fillInColor: Colors.amber),
            ],
            onChanged: (value) {
              setState(() {
                myVar = value;
              });
            },
          ),
              Divider(
                thickness:2,color:Colors.black,
              ),
              SizedBox(height: 10,),
              Text('Residential Address:'),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Address',
                ),
              ),
              SizedBox(height: 10,),
              Divider(
                thickness:2,color:Colors.black,
              ),
              SizedBox(height: 10,),
              Text('Zip Code:'),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: '43600',
                ),
              ),
                    CSCPicker(
                      onCountryChanged: (Countries){},
                      onCityChanged: (City){},
                      onStateChanged: (State){},
                    ),
            ],
            )
              ),
        ]
      ),
    ),
    );
  }
}


