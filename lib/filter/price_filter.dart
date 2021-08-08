import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class PriceFilter extends StatelessWidget {
  static const String id = 'PriceFilter';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.article), onPressed: () {}),
                  CustomText(
                    text: 'الغاء',
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: 'الحد الادني \n 3000',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomText(
                    text: 'الحد الافصي \n 5000',
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                // ignore: deprecated_member_use
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  color: secondaryColor,
                  onPressed: () => {},
                  child: CustomText(
                    text: 'تفعيل',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
