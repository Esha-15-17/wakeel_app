import 'package:flutter/material.dart';
import 'package:wakeel_app/notfications_screen.dart';
import 'menu.dart';
import 'legal_sevices.dart';
class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
          Text('    Recent Notifications'),
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
                  subtitle: Text('Messaged You'),
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