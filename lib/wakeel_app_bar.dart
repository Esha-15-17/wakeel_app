import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/Constant.dart';

import 'menu.dart';

class WakeelAppBar extends StatelessWidget {
  bool back = false;

  WakeelAppBar({super.key, required this.back});

  @override

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 600; // Adjust the width threshold as needed

    return Container(
      width: double.infinity,
      color: Color(Constants.App_green_color),
      child: Row(
        children: [
          back
              ? IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(Constants.App_yellow_color),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
              : Container(
            margin: EdgeInsets.all(16.0),
            child: Image.asset('assests/wakeel2_removebg_preview.png'),
          ),
          Spacer(),
          back
              ? Container(
            margin: EdgeInsets.all(16.0),
            child: Image.asset('assests/wakeel2_removebg_preview.png'),
          )
              : SizedBox(),
          back ? SizedBox(width: 2) : SizedBox(),
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.fromLTRB(
          //       isWideScreen ? 16.0 : 8.0, // Left
          //       8.0, // Top inset
          //       isWideScreen ? 16.0 : 8.0, // Right
          //       8.0, // Bottom inset
          //     ),
          //     child: TextField(
          //       style: TextStyle(color: Color(Constants.App_txt_color)),
          //       decoration: InputDecoration(
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(100),
          //           borderSide: BorderSide(
          //             color: Color(Constants.App_yellow_color),
          //           ),
          //         ),
          //         hintText: 'Search',
          //         hintStyle: TextStyle(color: Color(0XFF096A32)),
          //         contentPadding: EdgeInsets.all(8.0),
          //         suffixIcon: Icon(
          //           Icons.search,
          //           size: 15,
          //           color: Color(Constants.App_yellow_color),
          //         ),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(50),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(width: isWideScreen ? 10 : 0),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => menu(),
                ),
              );
            },
            child: Icon(
              Icons.view_headline_sharp,
              size: 18,
              color: Color(Constants.App_yellow_color),
            ),
          ),
          SizedBox(width: isWideScreen ? 15 : 0),
        ],
      ),
    );
  }
}