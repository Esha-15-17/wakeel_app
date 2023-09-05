import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:wakeel_app/Constant.dart';

import 'menu.dart';

class WakeelAppBar extends StatelessWidget {
  bool back = false;

  WakeelAppBar({super.key, required this.back});
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        color: const Color(Constants.App_green_color),
        child: Row(
          children: [
            back
                ? IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Color(Constants.App_yellow_color)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                : Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Image.asset('assests/wakeel2_removebg_preview.png'),
                  ),
            const Spacer(),
            back
                ? Image.asset('assests/wakeel2_removebg_preview.png')
                : const SizedBox(),
            back
                ? const SizedBox(width: 10,)
                : const SizedBox(),
            SizedBox(
              height: 27,
              width: 193,
              child: TextField(
                style: const TextStyle(color: Color(Constants.App_txt_color)),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                            color: Color(Constants.App_yellow_color))),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Color(0XFF096A32)),
                    contentPadding: const EdgeInsets.all(8.0),
                    suffixIcon: const Icon(Icons.search,
                        size: 10, color: Color(Constants.App_yellow_color)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      //  borderSide: BorderSide(color: Colors.white)
                    )),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => menu(),
                      ));
                },
                child: const Icon(Icons.view_headline_sharp,
                    size: 15, color: Color(Constants.App_yellow_color))),
            const SizedBox(width: 15),
          ],
        ),
      );

  }
}
