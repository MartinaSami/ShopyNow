import 'package:flutter/material.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import '../constants.dart';

class LaptopFilter extends StatefulWidget {
  static const String id = 'LaptopFilter';

  @override
  _LaptopFilterState createState() => _LaptopFilterState();
}

class _LaptopFilterState extends State<LaptopFilter> {
  bool checkboxValue = false;

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            CustomText(
              text: 'الغاء',
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
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
                CustomText(
                  text: 'الابتوب',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
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
                  CustomText(
                    text: 'اجهزه الكمبيوتر المحموله',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      checkboxValue = !checkboxValue;
                    });
                  },
                  child: checkboxValue
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.grey,
                          size: 20,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                          color: mainColor,
                          size: 20,
                        ),
                ),
                CustomText(
                  text: 'كمبيوتر',
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      checkboxValue = !checkboxValue;
                    });
                  },
                  child: checkboxValue
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.grey,
                          size: 20,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                          color: mainColor,
                          size: 20,
                        ),
                ),
                CustomText(
                  text: 'موبايلات',
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
