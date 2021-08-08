import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/auth/login/login_screen.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_text.dart';
import 'package:shopy_now/widgets/custom_textfield.dart';
import '../auth_api.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  static const String id = 'SignUpScreen';
  String name, email, password, mobile, passwordConfirmation;
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
                  text: 'انشاء حساب',
                  size: 15,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CustomTextField(
                  hint: 'الاسم',
                  onClick: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
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
                  hint: 'رقم الهاتف',
                  onClick: (value) {
                    mobile = value;
                  },
                  iconData: Icons.phone,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  hint: 'كلمة السر',
                  iconData: Icons.lock,
                  onClick: (value) {
                    password = value;
                  },
                  isSecure: true,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  hint: 'تأكيد كلمة السر',
                  onClick: (value) {
                    passwordConfirmation = value;
                  },
                  iconData: Icons.lock,
                  isSecure: true,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CustomButton(
                  text: 'دخول',
                  onClick: () {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      getAuth.userRegister(
                          name, email, password, mobile, context);
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
                      text: 'لدي حساب؟ ',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: CustomText(
                        text: 'تسجيل الدخول',
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
