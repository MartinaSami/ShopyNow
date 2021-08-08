import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class PersonalScreen extends StatelessWidget {
  static const String id = 'PersonalScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryColor, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/appbar-logo.png',
              width: width * 0.2,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Mohamed Adel',
                      size: 26,
                      color: secondaryColor,
                    ),
                    CustomText(
                      text: 'mohamedadel80080@gmail.com',
                      size: 15,
                      color: secondaryColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'معلوماتك الشخصية',
                          size: 15,
                        ),
                        CustomText(
                          text: 'تعديل',
                          color: secondaryColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'الاسم الاول',
                          ),
                          CustomText(
                            text: 'Mohamed',
                          ),
                          Divider(
                            color: Color(0XFF242451),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'اسم العائلة',
                          ),
                          CustomText(
                            text: 'Adel',
                          ),
                          Divider(
                            color: Color(0XFF242451),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'رقم الهاتف',
                          ),
                          CustomText(
                            text: '201022687846+',
                          ),
                          Divider(
                            color: Color(0XFF242451),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'معلومات الأمان',
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: secondaryColor,
                            width: 3,
                          ),
                        ),
                        child: Text(
                          'تغيير كلمة السر',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF242451),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
