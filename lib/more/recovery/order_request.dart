import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class OrderRequest extends StatelessWidget {
  static const String id = 'OrderRequest';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: secondaryColor,
                padding: EdgeInsets.all(10),
                child: CustomText(
                  text: 'اضف المنتج',
                  size: 13,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'حذاء كاجوال رياضي سهل الارتداء - كحلي'),
                  Image.asset('assets/images/smallblueshoes.png'),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(text: 'سبب الارجاع'),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'عايز ترجع المنتج ليه؟',
                    hintStyle: TextStyle(
                      color: Color(0XFF33499B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    )),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              CustomText(
                text: 'ارفع الفاتوره',
              ),
              SizedBox(
                height: height * .01,
              ),
              Container(
                color: secondaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: CustomText(
                  text: 'صور المنتج',
                  size: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomText(
                text: '500.jpg',
              ),
              CustomText(
                text: '500.jpg',
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  color: secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: CustomText(
                    text: 'قدم الطلب',
                    textAlign: TextAlign.center,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
