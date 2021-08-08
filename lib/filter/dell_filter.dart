import 'package:flutter/material.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class DellFilter extends StatelessWidget {
  const DellFilter({Key key}) : super(key: key);
  static const String id = 'DellFilter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 20,
              ),
              CustomText(
                text: 'ديل 22',
                textAlign: TextAlign.left,
              ),
              Divider(
                thickness: 1,
              ),
              CustomText(
                text: 'اتش بي',
                textAlign: TextAlign.left,
              ),
              Divider(
                thickness: 1,
              ),
              CustomText(
                text: 'ابل',
                textAlign: TextAlign.left,
              ),
              Divider(
                thickness: 1,
              ),
              CustomText(
                text: 'مايكروسوفت',
                textAlign: TextAlign.left,
              ),
              Divider(
                thickness: 1,
              ),
              CustomText(
                text: 'اسوس',
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 50,
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
