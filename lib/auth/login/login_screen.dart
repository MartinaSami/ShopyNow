import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/auth/forget_password/forget_password.dart';
import 'package:shopy_now/auth/signup/signup_screen.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_text.dart';
import 'package:shopy_now/widgets/custom_textfield.dart';

import '../auth_api.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';
  String email, password;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var getAuth = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _globalKey,
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
                  text: 'تسجيل الدخول',
                  size: 15,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CustomTextField(
                  hint: 'البريد الالكتروني',
                  onClick: (value) {
                    email = value;
                  },
                  iconData: Icons.alternate_email,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  hint: 'كلمة السر',
                  onClick: (value) {
                    password = value;
                  },
                  iconData: Icons.lock,
                  isSecure: true,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetPassword.id);
                  },
                  child: CustomText(
                    text: 'هل نسيت كلمة السر؟',
                    color: Color(0XFFFF0000),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CustomButton(
                  text: 'دخول',
                  onClick: () {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      getAuth.userLogin(email, password, context);
                    } else {
                      print('null');
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'ليس لدي حساب؟ ',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: CustomText(
                        text: 'انشاء حساب',
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Divider(
                        color: secondaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: CustomText(
                        text: 'تسجيل ب استخدام',
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icons/google_icon.png',
                        width: width * 0.085,
                        height: height * 0.085,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icons/facebook_icon.png',
                        width: width * 0.1,
                        height: height * 0.1,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
