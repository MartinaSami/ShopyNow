import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/more/payment/payment_bill.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class OrderMenu extends StatelessWidget {
  static const String id = 'OrderMenu';

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              'طلباتك',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: mainColor),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: 'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                        size: 12,
                        color: mainColor),
                    CustomText(
                        text: 'قيد التجهيز', size: 12, color: secondaryColor),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, PaymentBill.id),
                      child: Row(
                        children: [
                          CustomText(
                              text: 'اطلع علي', size: 12, color: mainColor),
                          InkWell(
                            child: CustomText(
                                text: ' التفاصيل',
                                size: 12,
                                color: secondaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/smallblueshoes.png',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: 'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                        size: 12,
                        color: mainColor),
                    CustomText(
                        text: ' تم استلامها من الساعي ',
                        size: 12,
                        color: secondaryColor),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, PaymentBill.id),
                      child: Row(
                        children: [
                          CustomText(
                              text: 'اطلع علي', size: 12, color: mainColor),
                          InkWell(
                            child: CustomText(
                                text: ' التفاصيل',
                                size: 12,
                                color: secondaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/smallblueshoes.png',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: 'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                        size: 12,
                        color: mainColor),
                    CustomText(
                        text: 'تم التوصيل', size: 12, color: secondaryColor),
                    InkWell(
                      // onTap: () => Navigator.pushNamed(context, PaymentBill.id),
                      child: Row(
                        children: [
                          CustomText(
                              text: 'اطلع علي', size: 12, color: mainColor),
                          InkWell(
                            child: CustomText(
                                text: ' التفاصيل',
                                size: 12,
                                color: secondaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/smallblueshoes.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
