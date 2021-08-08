import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import 'order_request.dart';

// ignore: must_be_immutable
class RecoveryScreen extends StatelessWidget {
  static const String id = 'RecoveryScreen';
  List orders = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: TabBarView(children: [
          orders.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'مفيش اي منتجات عملتلها طلب ارجاع',
                      size: 15,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, OrderRequest.id);
                      },
                      child: Container(
                        color: secondaryColor,
                        padding: EdgeInsets.all(20),
                        child: CustomText(
                          text: 'تقديم طلب',
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                              ),
                              CustomText(
                                text: 'تمت الموافقه سيتم التواصل معك',
                              ),
                            ],
                          ),
                          Image.asset('assets/images/smallblueshoes.png'),
                        ],
                      )
                    ],
                  ),
                ),
          orders.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'مفيش اي منتجات عملتها اتوافق عليها',
                      size: 15,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: CustomText(
                          text: 'تقديم طلب',
                          size: 15,
                        ),
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                              ),
                              CustomText(
                                text: 'تمت الموافقه سيتم التواصل معك',
                              ),
                            ],
                          ),
                          Image.asset('assets/images/smallblueshoes.png'),
                        ],
                      )
                    ],
                  ),
                )
        ]),
      ),
    );
  }
}
