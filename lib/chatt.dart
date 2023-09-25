import 'package:flutter/material.dart';
import 'package:wakeel_app/Constant.dart';
import 'chatwidget.dart';
import 'appointment.dart';
class Chat extends StatelessWidget {
  Chat(
      {super.key,
        required this.text,
        required this.type,
        required this.textColor,
       });

  String text;
  int textColor;
  String type;


  @override
  Widget build(BuildContext context) {

    bool isSender = type == "sender";
    int textColor = isSender ? Constants.App_yellow_color : Constants.App_txt_color ;
    int boxColor = isSender ? Constants.App_green_color : Constants.App_yellow_color;
    int borderColor = isSender ? Constants.App_green_color : Constants.App_txt_color;
    var alignment = isSender ?  MainAxisAlignment.end : MainAxisAlignment.start;
    double topRight = isSender ? 0 : 5;
    double topLeft = isSender ? 5 : 0;


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Color(boxColor),
              border: Border.all(
                color: Color(borderColor),
                width: 1.0,
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(topRight),
                  topLeft: Radius.circular(topLeft),
                  bottomLeft: const Radius.circular(5),
                  bottomRight: const Radius.circular(5)),
            ),
            child: Center(child: Text(text,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(textColor)))),
          ),
        ],
      ),
    );
  }
}