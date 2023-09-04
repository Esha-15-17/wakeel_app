import 'package:flutter/material.dart';
import 'package:wakeel_app/reviews_screen.dart';
import 'chatwidget.dart';
import 'notfications_screen.dart';

class RecentMessages extends StatelessWidget {
  const RecentMessages({super.key});

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
                child: Icon(Icons.settings)),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('    Recent Messages'),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Adv. Mohd Momin'),
                  trailing: Text('4h ago'),
                  subtitle: Text('Hey! How are you going?'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assests/Frame2.png'),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}