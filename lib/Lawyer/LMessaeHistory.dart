import 'package:flutter/material.dart';
import 'package:wakeel_app/Constant.dart';

import 'package:wakeel_app/chatwidget.dart';
import 'package:wakeel_app/wakeel_app_bar.dart';


class LMessaeHistory extends StatefulWidget {
  const LMessaeHistory({super.key});

  @override
  State<LMessaeHistory> createState() => _LMessaeHistoryState();
}

class _LMessaeHistoryState extends State<LMessaeHistory> {
  final List<Map<String, String>> list = [
    {
      'avatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'name': 'Bashir Momin',
      'last_msg': 'Hey! How are you going?',
      'time': '4h Ago',
    },
    {
      'avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'name': 'ABC Momin',
      'last_msg': 'Hey! How are you going?',
      'time': '5h Ago',
    },
    {
      'avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'name': 'Bashir Momin',
      'last_msg': 'Hey! How are you going?',
      'time': '4h Ago',
    },
    {
      'avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'name': 'ABC Momin',
      'last_msg': 'Hey! How are you going?',
      'time': '5h Ago',
    },
    {
      'avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'name': 'Bashir Momin',
      'last_msg': 'Hey! How are you going?',
      'time': '4h Ago',
    },
    {
      'avatar':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDeslexVHfYWvbp6HNBGJ5V9lElvRx-lr1ZJS9SH9Ju8HP6GsZcvc60GAaxdCaCLJGROU&usqp=CAU',
      'name': 'ABC Momin',
      'last_msg': 'Hey! How are you going?',
      'time': '5h Ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: WakeelAppBar(back: false),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text('Recent Messages',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(Constants.App_txt_color))),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length, // Adjust the number of items as needed
              itemBuilder: (context, index) {
                final item = list[index];

                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ChatScreen()));

                      },
                      child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27.5),
                            // Adjust the radius as needed
                            border: Border.all(
                              color: const Color(Constants.App_yellow_color),
                              // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(27.5),
                            child: Image.network(
                              item['avatar']!,
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name']!,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(Constants.App_txt_color)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                item['last_msg']!,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(Constants.App_txt_color)),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assests/time.png',
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              item['time']!,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(Constants.App_txt_color)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
