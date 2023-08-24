import 'package:flutter/material.dart';
import 'package:wakeel_app/client_lawyer.dart';
import 'log_inScreen.dart';
import 'signup_lawyer.dart';


class cl extends StatefulWidget {
  const cl({super.key});

  @override
  State<cl> createState() => _clState();
}

class _clState extends State<cl> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                      height: 150,
                      width: 300,
                      child: Center(
                          child: Image.asset('assests/tarazo.png'))),
                ),
                SizedBox(
                    height: 100),
                Padding(padding: EdgeInsets.only(left: 20, right: 20),
                  child:
                  Container(
                    height: 35,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Color(0xff01411C),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>signuplawyer(userRole: 'client'),
                                ));
                          },
                          child: Text(
                            'Sign up as CLIENT',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                    height: 30),
                Padding(padding: EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>signuplawyer(userRole: 'lawyer',),
                          ));
                    },
                    child: Container(
                      height: 35, width: 160,
                      decoration: BoxDecoration(color: Color(0xff01411C), borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text(
                        'Sign up as LAWYWER',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

}