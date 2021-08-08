import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import 'filter_list.dart';

class FilterPage extends StatelessWidget {
  static const String id = 'FilterPage';

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
      backgroundColor: Color.fromRGBO(237, 237, 236, 1),
      body: ListView(
        children: [
          Container(
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  CustomText(
                   text: 'الفلتر',
                    textAlign: TextAlign.center,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 15),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'الفئات'),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  onPressed: () {
                    Navigator.pushNamed(context, FilterList.id);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomText(
            text: 'الاكثر انتشارا',
            size: 20,
            color: secondaryColor,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'السعر: من الاعلي الي الاقل'),
                    IconButton(
                        icon: Icon(
                          Icons.check_circle,

                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   CustomText(text: 'السعر: من الاقل الي الاعلي'),
                    IconButton(
                        icon: Icon(
                          Icons.check_circle_outline_sharp,

                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
