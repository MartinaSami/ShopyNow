import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopy_now/auth/login/login_screen.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/more/address/info_view.dart';
import 'package:shopy_now/more/cash_back/cash_back_screen.dart';
import 'package:shopy_now/more/fav/more_favorite_screen.dart';
import 'package:shopy_now/more/log_out/log_out_api.dart';
import 'package:shopy_now/more/orders/order_menu.dart';
import 'package:shopy_now/orders/orders_screen.dart';
import 'package:shopy_now/more/payment/payment_page.dart';
import 'package:shopy_now/more/personal/personal_screen.dart';
import 'package:shopy_now/more/recovery/recovery_screen.dart';
import 'package:shopy_now/widgets/custom_more_row.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'اهلا محمد',
                      color: secondaryColor,
                    ),
                    CustomText(
                      text: 'mohamed@gmail.com',
                      color: secondaryColor,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, OrdersScreen.id);
                                  },
                                  child: Image.asset(
                                    'assets/icons/box.png',
                                    width: 40,
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: secondaryColor,
                                ),
                              ),
                              CustomText(
                                text: 'الطلبات',
                                color: secondaryColor,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RecoveryScreen.id);
                                  },
                                  child: Image.asset(
                                    'assets/icons/rebuy.png',
                                    width: 40,
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: secondaryColor,
                                ),
                              ),
                              CustomText(
                                text: 'استرجاع',
                                color: secondaryColor,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, CashBackScreen.id);
                                },
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/bocket.png',
                                    width: 40,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: secondaryColor,
                                  ),
                                ),
                              ),
                              CustomText(
                                text: 'كاش باك',
                                color: secondaryColor,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MoreFavoriteScreen.id);
                                },
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/fav.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: secondaryColor,
                                  ),
                                ),
                              ),
                              CustomText(
                                text: 'المفضلة',
                                color: secondaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                color: Colors.grey[100],
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: CustomText(
                    text: 'حسابي',
                    textAlign: TextAlign.right,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomMoreRow(
                name: 'قائمتي المفضلة',
                onClick: () {
                  Navigator.pushNamed(context, OrderMenu.id);
                },
              ),
              CustomMoreRow(
                name: 'العناوين',
                onClick: () {
                  Navigator.pushNamed(context, InfoView.id);
                },
              ),
              CustomMoreRow(
                name: 'الدفع',
                onClick: () {
                  Navigator.pushNamed(context, PaymentPage.id);
                },
              ),
              CustomMoreRow(
                name: 'الملف الشخصي',
                onClick: () {
                  Navigator.pushNamed(context, PersonalScreen.id);
                },
              ),
              SizedBox(height: height * 0.02),
              Container(
                color: Colors.grey[100],
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: CustomText(
                    text: 'الاعدادات',
                    textAlign: TextAlign.right,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomMoreRow(
                name: 'البلد',
                onClick: () {},
              ),
              CustomMoreRow(
                name: 'تفضيلات',
                onClick: () {},
              ),
              SizedBox(height: height * 0.02),
              Container(
                color: Colors.grey[100],
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: CustomText(
                    text: 'تواصل معنا',
                    textAlign: TextAlign.right,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomMoreRow(
                name: 'الاتصال بنا',
                onClick: () {},
              ),
              CustomMoreRow(
                name: 'تسجيل الخروج',
                onClick: () {
                  logOut(context);
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
