import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onClick;
  final Color color;
  CustomButton({
    @required this.text,
    this.onClick,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: secondaryColor,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
