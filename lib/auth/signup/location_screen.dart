import 'package:flutter/material.dart';
import 'package:shopy_now/auth/signup/phoneAuth_screen.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_text.dart';
import 'package:shopy_now/widgets/custom_textfield.dart';

class LocationScreen extends StatelessWidget {
  static const String id = 'LocationScreen';
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
                text: 'انشاء حساب',
                size: 15,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomTextField(
                hint: 'اسم المنطقة',
                onClick: (value) {},
                // iconData: Icons.keyboard_arrow_down,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                hint: 'العنوان',
                onClick: (value) {},
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomButton(
                text: 'التالي',
                onClick: () {
                  Navigator.pushNamed(context, PhoneAuthScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
