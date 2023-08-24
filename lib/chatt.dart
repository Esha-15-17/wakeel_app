import 'package:flutter/material.dart';
import 'chatwidget.dart';
import 'appointment.dart';
class Chat extends StatelessWidget {
  Chat(
      {super.key,
        required this.text,
        required this.color,
        required this.topLeft,
        required this.topRight,
        required this.bottomLeft,
        required this.bottomRight});

  String text;
  Color color;
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50,
            width: 150,
            child: Center(child: Text(text)),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(topRight),
                  topLeft: Radius.circular(topLeft),
                  bottomLeft: Radius.circular(bottomLeft),
                  bottomRight: Radius.circular(bottomRight)),
            ),
          ),
        ],
      ),
    );
  }
}