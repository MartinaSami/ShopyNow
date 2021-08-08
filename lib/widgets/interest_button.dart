import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class InterestButton extends StatefulWidget {
  @override
  _InterestButtonState createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool tapped = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // ignore: unnecessary_statements
          if (tapped == true) {
            tapped = false;
          } else {
            tapped = true;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: tapped ? Colors.white : Color(0xFF3FEDE5),
          border: Border.all(
            color: tapped ? Color(0XFF33499B) : Color(0xFF3FEDE5),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        child: CustomText(
          text: 'موبايلات',
          color: tapped ? Color(0XFF33499B) : Colors.white,
          size: 12,
        ),
      ),
    );
  }
}
