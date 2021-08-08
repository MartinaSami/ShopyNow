import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import 'continue_order_with_visa_number.dart';

class VisaPayment extends StatefulWidget {
  static const String id = 'VisaPayment';

  @override
  _VisaPaymentState createState() => _VisaPaymentState();
}

class _VisaPaymentState extends State<VisaPayment> {
  Color color = Color.fromRGBO(36, 36, 81, 1);
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'نقبل',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icons/visa.png'),
                      SizedBox(
                        width: width / 40,
                      ),
                      Image.asset('assets/icons/mastercard.png'),
                    ],
                  ),
                  SizedBox(
                    height: height / 10,
                  ),
                  CustomText(
                    text: 'رقم الكارت',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width / 3,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: "ادخل رقم الكارت",
                              hintStyle: TextStyle(fontFamily: 'Cairo')),
                        ),
                      ),
                      Image.asset('assets/icons/credit-card.png'),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(text: 'تاريخ انتهاء الصلاحيه'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomText(text: 'CVV'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                                hintText: "MM/YY",
                                hintStyle: TextStyle(
                                  fontFamily: 'Cairo',
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                                hintText: "CW رمز",
                                hintStyle: TextStyle(
                                  fontFamily: 'Cairo',
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'تذكر هذه البطاقه',
                        size: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            checkboxValue = !checkboxValue;
                          });
                        },
                        child: checkboxValue
                            ? Icon(
                                Icons.radio_button_unchecked,
                                color: Colors.grey,
                                size: 20,
                              )
                            : Icon(
                                Icons.check_circle,
                                color: mainColor,
                                size: 20,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ContinueOrderWithVisaNumber.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0XFF242451),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: CustomText(
                    text: 'تأكيد',
                    textAlign: TextAlign.center,
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
