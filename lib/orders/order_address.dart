import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/orders/orders_screen.dart';
import 'package:shopy_now/orders/orders_provider.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_textfield.dart';

import '../constants.dart';

class OrderAddress extends StatefulWidget {
  static const String id = 'OrderAddress';

  @override
  _OrderAddressState createState() => _OrderAddressState();
}

class _OrderAddressState extends State<OrderAddress> {
  String address;

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var addOrder = Provider.of<OrdersProvider>(context, listen: false);
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
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    child: CustomTextField(
                  hint: 'ادخل العنوان',
                  onClick: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                )),
              ),
              Container(
                width: double.infinity,
                child: CustomButton(
                  text: 'عرض الاوردارات',
                  onClick: () {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      addOrder.addOrder(address, context);
                      Navigator.pushNamed(context, OrdersScreen.id);
                    } else {
                      print('null');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
