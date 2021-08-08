import 'package:flutter/material.dart';
import 'package:shopy_now/filter/price_filter.dart';
import 'package:shopy_now/filter/recently_arrived.dart';
import 'package:shopy_now/widgets/custom_listView.dart';
import 'package:shopy_now/widgets/custom_text.dart';
import '../constants.dart';
import 'dell_filter.dart';
import 'laptop_filter.dart';

class FilterList extends StatelessWidget {
  static const String id = 'FilterList';

  const FilterList({Key key}) : super(key: key);

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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              CustomText(
                text: 'الفئه',
                size: 20,
              ),
              CustomListView(
                text: 'اللابتوب',
                onTap: () {
                  Navigator.pushNamed(context, LaptopFilter.id);
                },
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'الماركه',
                onTap: () {
                  Navigator.pushNamed(context, DellFilter.id);
                },
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'السعر',
                onTap: () {
                  Navigator.pushNamed(context, PriceFilter.id);
                },
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'وصل حديثا',
                onTap: () {
                  Navigator.pushNamed(context, RecentlyArrived.id);
                },
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'نوع الابتوب ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'نوع المعالج ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: ' حجم ذاكره الرام ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: ' حجم القرص الصلب ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: ' ذاكره الرسومات ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: ' التخزين ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'حجم الشاشه ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'نظام التشغيل ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'اللون  ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'اصدار نظام التشغيل  ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'البائع  ',
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: secondaryColor,
                    onPressed: () => {},
                    child: CustomText(text: 'تاكيد'),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () => {},
                    child: CustomText(text: 'الغاء'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
