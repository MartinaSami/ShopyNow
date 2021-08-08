import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class InfoView extends StatelessWidget {
  static const String id = 'InfoView';

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
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: secondaryColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: CustomText(
                                    text: 'رئيسي',
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomText(
                            text: 'تعديل',
                            color: secondaryColor,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'الاسم',
                                  color: mainColor,
                                  size: 12,
                                ),
                                CustomText(
                                  text: 'Mohamed Adel',
                                  color: mainColor,
                                  size: 12,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'العنوان',
                                  color: mainColor,
                                  size: 12,
                                ),
                                CustomText(
                                  text: 'القاهره - مترو حلوان - مصر',
                                  color: mainColor,
                                  size: 12,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'رقم الموبيل',
                                  color: mainColor,
                                  size: 12,
                                ),
                                CustomText(
                                  text: '01022687846',
                                  color: mainColor,
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: 2),
        ));
  }
}
