import 'package:flutter/material.dart';
import 'package:wakeel_app/notfications_screen.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';
import 'menu.dart';
import 'legal_sevices.dart';
class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: false),
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