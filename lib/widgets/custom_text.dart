import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight weight;
  TextAlign textAlign;
  CustomText({
    this.text,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign = textAlign == null ? TextAlign.center : textAlign,
      style: TextStyle(
        color: color = color == null ? Color(0XFF33499B) : color,
        fontSize: size = size == null ? 12 : size,
        fontWeight: weight =
            weight == null ? FontWeight.bold : FontWeight.normal,
        fontFamily: 'Cairo',
      ),
    );
  }
}
