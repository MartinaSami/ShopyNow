import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hint;
  final Function onClick;
  final IconData iconData;
  final TextEditingController controller;
  bool isSecure = false;
  Function onTap;
  // ignore: missing_return
  String _errorMessage(String str) {
    switch (hint) {
      case 'الاسم':
        return 'الاسم فارغ';
      case 'البريد الالكتروني':
        return 'البريد الالكتروني فارغ';
      case 'رقم الهاتف':
        return 'رقم الهاتف فارغ';
      case 'كلمة السر':
        return 'كلمة السر فارغة';
      case 'تأكيد كلمة السر':
        return 'تأكيد كلمة السر فارغة';
      case 'ادخل العنوان':
        return 'العنوان فارغ';
    }
  }

  CustomTextField({
    @required this.hint,
    @required this.onClick,
    this.iconData,
    this.controller,
    this.isSecure,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(

        controller: controller,
        onTap: onTap == null ? null : onTap,
        obscureText: isSecure == null ? false : isSecure,
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return _errorMessage(hint);
          }
        },
        onChanged: onClick,

        decoration: InputDecoration(
          suffixIcon: Icon(
            iconData,
            color: secondaryColor,
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 15,
            fontFamily: 'Cairo',
            color: mainColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
        ),
      ),
    );
  }
}
