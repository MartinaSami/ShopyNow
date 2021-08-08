import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopy_now/cart/visa_payment.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class ContinueOrder extends StatefulWidget {
  static const String id = 'ContinueOrder';

  @override
  _ContinueOrderState createState() => _ContinueOrderState();
}

class _ContinueOrderState extends State<ContinueOrder> {
  bool checkboxValue = false;
  bool moneyCheckBox = true;
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'الشحن الى',
                              color: secondaryColor,
                            ),
                            CustomText(
                              text: 'تغيير العنوان',
                              color: secondaryColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: 'حلوان - القاهره - مصر - 51788',
                        ),
                        CustomText(
                          text: '201022687846+',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomText(
                      text: 'طريقة الدفع',
                      color: secondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        checkboxValue = !checkboxValue;
                                        moneyCheckBox = !moneyCheckBox;
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
                                            color: Color(0XFF242451),
                                            size: 20,
                                          ),
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: "الدفع باستخدام كارت البنك",
                                    color: mainColor,
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/icons/credit-card.png',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, VisaPayment.id),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0XFF242451),
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: CustomText(
                                    text: 'اضافة كارت دفع',
                                    textAlign: TextAlign.center,
                                    color: secondaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    moneyCheckBox = !moneyCheckBox;
                                    checkboxValue = !checkboxValue;
                                  });
                                },
                                child: moneyCheckBox
                                    ? Icon(
                                        Icons.radio_button_unchecked,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.check_circle,
                                        color: Color(0XFF242451),
                                        size: 20,
                                      ),
                              ),
                              SizedBox(width: 8),
                              CustomText(
                                text: "الدفع نقدا",
                                color: mainColor,
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/icons/money-bill.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: CustomText(
                      text: 'ملخص الطلبية',
                      color: secondaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'مجموع السعر',
                                color: mainColor,
                              ),
                              CustomText(
                                text: '100 ج.م',
                                color: mainColor,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'سعر الشحن',
                                color: mainColor,
                              ),
                              CustomText(
                                text: '20 ج.م',
                                color: mainColor,
                              ),
                            ],
                          ),
                          Divider(
                            color: Color(0XFF30305B),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'مجموع السعر',
                                color: mainColor,
                              ),
                              CustomText(
                                text: '120 ج.م',
                                color: mainColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: CustomText(
                      text: 'مراجعة الطلبية',
                      color: secondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'اديدس',
                                    ),
                                    CustomText(
                                      text:
                                          'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                                    ),
                                    CustomText(
                                      text: '100 جم',
                                      size: 17,
                                    ),
                                    CustomText(
                                      text: 'الكمية 1',
                                    ),
                                    CustomText(
                                      text: 'التوصيل خلال 3 ايام',
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: 'توصيل',
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        CustomText(
                                          text: 'الخميس 4 مايو',
                                          color: secondaryColor,
                                        ),
                                      ],
                                    ),
                                    CustomText(
                                      text: 'البائع ماركتلي',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Image.asset(
                                  'assets/images/black-laptop.png',
                                  width: 50,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0XFF242451),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: CustomText(
                  text: 'اطلب دلوقتي',
                  textAlign: TextAlign.center,
                  size: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
