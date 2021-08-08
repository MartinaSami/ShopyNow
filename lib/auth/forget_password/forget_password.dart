import 'package:flutter/material.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_text.dart';
import 'package:shopy_now/widgets/custom_textfield.dart';

import 'forget_password_code.dart';

class ForgetPassword extends StatelessWidget {
  static const String id = 'ForgetPassword';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: height * .1,
            ),
            Hero(
              tag: 'Logo',
              child: Image.asset(
                'assets/images/marketlii.png',
                height: 56,
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            CustomText(
              text: 'هل نسيت كلمة السر؟',
              weight: FontWeight.bold,
              size: 20,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * .05,
            ),
            CustomTextField(
              hint: 'البريد الالكتروني او رقم الهاتف',
              onClick: (value) {},
            ),
            SizedBox(
              height: height * .03,
            ),
            CustomButton(
              onClick: () {
                Navigator.pushNamed(context, ForgetPasswordCode.id);
              },
              text: 'استرجاع',
            ),
          ],
        ),
      ),
    ));
  }
}
