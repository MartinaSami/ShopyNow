import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class CashBackScreen extends StatelessWidget {
  static const String id = 'CashBackScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secondaryColor,
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
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    CustomText(
                      text: 'رصيد المحفظة',
                      size: 14,
                    ),
                    CustomText(
                      text: '0.00 ج.م',
                      size: 25,
                      color: secondaryColor,
                    ),
                    CustomText(
                      text: 'استخدم كارت خصم',
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CustomText(
                text: 'لسه معندكش رصيد اشتري عشان يرجعلك كاش باك',
                size: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
