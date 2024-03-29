import 'package:flutter/material.dart';
import 'package:wakeel_app/notfications_screen.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';

class LNotifications extends StatelessWidget {
  const LNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: false),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('    Recent Notifications'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('Mohd Momin'),
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