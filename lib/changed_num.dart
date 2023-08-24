import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'log_inScreen.dart';
import 'menu.dart';
class changednumber extends StatelessWidget {
  const changednumber({Key? key}) : super(key: key);


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
                    SizedBox(
                      height: 50,
                      width: 100,
                    ),
                    Text(
                      'Change Number',
                      textAlign:TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Connect with us by adding your number.'),
                    SizedBox(
                      height: 30,
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: TextField(
                              style: TextStyle(color: Color(0xff01411C)),
                              decoration: InputDecoration(
                                  hintText: '+92',
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
                          )
                      ),
                          const SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: 30,
                          width: 250,
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: TextField(
                              style: TextStyle(color: Color(0xff01411C)),
                              decoration: InputDecoration(
                                  hintText: '333 0000000',
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
                          )
                      ),

                    ],
                  ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 250,
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: TextField(
                            style: TextStyle(color: Color(0xff01411C)),
                            decoration: InputDecoration(
                                hintText: 'Add New Number',
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
                        )
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Color(0xff01411C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                            'Changed Number',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                    ),

    ]
    ),
    )
    ),
    );
  }


  }