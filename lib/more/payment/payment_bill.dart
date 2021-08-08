import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/main.dart';

import 'package:shopy_now/widgets/custom_text.dart';

class PaymentBill extends StatelessWidget {
  static const String id = 'PaymentBill';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/white-shoes.png',
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: width / 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: 'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                              size: 12,
                              color: mainColor),
                          CustomText(
                              text: ' ج.م100 ', size: 20, color: mainColor),
                          CustomText(
                              text: 'ميعاد التوصيل /17 مايو ',
                              size: 14,
                              color: secondaryColor),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: '1', size: 20, color: mainColor),
                      CustomText(text: 'الكميه', size: 20, color: mainColor),
                    ],
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey[300],
                        size: 30,
                      ),
                      CustomText(text: 'اللون', size: 20, color: mainColor),
                    ],
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Row(
                    children: [
                      CustomText(text: 'سعر القطع', size: 10, color: mainColor),
                      SizedBox(
                        width: 7,
                      ),
                      CustomText(text: ' 100ج.م', size: 12, color: mainColor),
                    ],
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Row(
                    children: [
                      CustomText(
                          text: 'سعر التوصيل', size: 10, color: mainColor),
                      SizedBox(
                        width: 7,
                      ),
                      CustomText(text: ' 20.م', size: 12, color: mainColor),
                    ],
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: ' الاجمالي', size: 15, color: mainColor),
                      SizedBox(
                        width: 7,
                      ),
                      CustomText(text: ' 120.م', size: 20, color: mainColor),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  CustomText(text: 'عنوان التوصيل', size: 18, color: mainColor),
                  CustomText(
                      text: ' حلوان-القاهره-مصر', size: 14, color: mainColor),
                  CustomText(text: ' 2010245454+', size: 14, color: mainColor),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, MyHomePage.id),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              width: double.infinity,
              color: secondaryColor,
              child: CustomText(
                text: 'الذهاب للرئيسية',
                textAlign: TextAlign.center,
                size: 13,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
