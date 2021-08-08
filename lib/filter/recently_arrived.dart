import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class RecentlyArrived extends StatefulWidget {
  static const String id = 'RecentlyArrived';

  @override
  _RecentlyArrivedState createState() => _RecentlyArrivedState();
}

class _RecentlyArrivedState extends State<RecentlyArrived> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.article), onPressed: () {}),
                  CustomText(
                    text: 'الغاء ',
                  ),
                ],
              ),
              Theme(
                data: new ThemeData(
                  primaryColor: secondaryColor,
                  primaryColorDark: secondaryColor,
                ),
                child: new TextField(
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: secondaryColor)),
                      hintText: 'بحث',
                      hintStyle: TextStyle(
                        fontFamily: 'Cairo',
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: secondaryColor,
                      ),
                      suffixStyle: const TextStyle(
                        color: secondaryColor,
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: ' اخر 7 ايام ',
                    textAlign: TextAlign.left,
                    color: mainColor,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          checkboxValue1 = !checkboxValue1;
                        });
                      },
                      child: checkboxValue1
                          ? Icon(
                              Icons.check_box,
                              color: secondaryColor,
                              size: 20,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: secondaryColor,
                              size: 20,
                            )),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'اخر 30 ايام',
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          checkboxValue2 = !checkboxValue2;
                        });
                      },
                      child: checkboxValue2
                          ? Icon(
                              Icons.check_box,
                              color: secondaryColor,
                              size: 20,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: secondaryColor,
                              size: 20,
                            )),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: ' اخر 60 ايام ',
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          checkboxValue3 = !checkboxValue3;
                        });
                      },
                      child: checkboxValue3
                          ? Icon(
                              Icons.check_box,
                              color: secondaryColor,
                              size: 20,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: secondaryColor,
                              size: 20,
                            )),
                ],
              ),

              SizedBox(
                height: 70,
              ),
              // ignore: deprecated_member_use
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
            ],
          ),
        ),
      ),
    );
  }
}
