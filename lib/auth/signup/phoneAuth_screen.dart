import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import 'interests_screen.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'PhoneAuthScreen';

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool _onEditing = true;
  String _code;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo.png',
                  width: width * 0.1,
                  height: height * 0.1,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomText(
                text: 'تأكيد رقم الهاتف',
                size: 15,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(
                text: 'يرجى كتابة الكود المرسل اليك',
                weight: FontWeight.normal,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: VerificationCode(
                  keyboardType: TextInputType.number,
                  length: 4,
                  autofocus: false,
                  onCompleted: (String value) {
                    print(value);
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              CustomText(
                text: '00:30',
                size: 15,
                weight: FontWeight.normal,
              ),
              InkWell(
                onTap: () {},
                child: CustomText(
                  text: 'ارسال مره اخرى',
                  size: 15,
                  weight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomButton(
                text: 'تأكيد',
                onClick: () {
                  Navigator.pushNamed(context, InterestScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
