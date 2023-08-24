import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'find_lawyer.dart';
import 'signup_lawyer.dart';
import 'menu.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
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
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => menu(),
                                    ));
                              },
                              child: Icon(Icons.view_headline_sharp)),
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
              height: 90,
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Image.asset('assests/LAW.PNG'),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adv. Bashir',
                      ),
                      Text('Momin'),
                      Text('Defence Karachi'),
                      Text('10 Years'),
                      Row(
                        children: [
                          Text('Promo Code'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('ASKL2000')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              color: Color.fromARGB(255, 20, 74, 22),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => findlawyer() ));
                    },
                    child: Text('Cheque Bounce')),
                Text(
                  ' | ',
                  style: TextStyle(fontSize: 10),
                ),
                Text('Criminal'),
                Text(
                  ' | ',
                  style: TextStyle(fontSize: 10),
                ),
                Text('Consumer Court'),
                Text(
                  ' | ',
                  style: TextStyle(fontSize: 10),
                ),
                Text('Civil'),
                Text(
                  ' | ',
                  style: TextStyle(fontSize: 10),
                ),
                Text('Family'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              width: 150,
              child: Center(
                  child: Text(
                    'Proceed To Booking',
                    style: TextStyle(color: Colors.white),
                  )),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 29, 86, 31),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text(
                  'The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software.'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                ),
                Text('Enrollment'),
                SizedBox(
                  width: 80,
                ),
                Text('84639 324 249'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                ),
                Text('Language Spoken'),
                SizedBox(
                  width: 39,
                ),
                Text('English, Urdu, Punjabi'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Court',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                ),
                Text('Family Court'),
                SizedBox(
                  width: 53,
                ),
                Text('Lahore, High Court'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                ),
                Text('Supreme Court'),
                SizedBox(
                  width: 40,
                ),
                Text('Islamabad'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Experience',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                ),
                Text('Family Court'),
                SizedBox(
                  width: 55,
                ),
                Text('2 Years'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                ),
                Text('Supreme Court,'),
                SizedBox(
                  width: 39,
                ),
                Text('Islamabad'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('Top Reviews'),
                SizedBox(
                  width:170,
                ),
                Text('Viewl All'),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
             SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assests/Frame2.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            '“Natural Beauty and Spa Salon App \nUI Kit is packed.\n Natural Beauty and Spa \nSalon App UI Kit is packed.\n Natural Beauty and Spa Salon”'),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text('Razel'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('sep 03'),
                        SizedBox(
                          width: 10,
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          itemSize: 20,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 31, 106, 33),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.heart_broken),
                        Text('24 Likes'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.reply),
                        Text('Reply'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assests/Frame2.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            '“Natural Beauty and Spa Salon App \nUI Kit is packed.\n Natural Beauty and Spa \nSalon App UI Kit is packed.\n Natural Beauty and Spa Salon”'),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text('Razel'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('sep 03'),
                        SizedBox(
                          width: 10,
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          itemSize: 20,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 31, 106, 33),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.heart_broken),
                        Text('24 Likes'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.reply),
                        Text('Reply'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff01411C),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: Icon(Icons.message_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Notification',
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}