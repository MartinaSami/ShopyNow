import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/orders/orders_provider.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import '../constants.dart';

// ignore: must_be_immutable
class GetOneOrder extends StatelessWidget {
  static const String id = 'GetOneOrder';
  String orderId;
  GetOneOrder({this.orderId});

  @override
  Widget build(BuildContext context) {
    var getOneOrder = Provider.of<OrdersProvider>(context, listen: false);
    getOneOrder.oneOrder(orderId);
    var addOrder = Provider.of<OrdersProvider>(context, listen: false);
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
            Consumer<OrdersProvider>(
              builder: (ctx, order, _) {
                return order.getOrderData == null
                    ? Center(child: CircularProgressIndicator())
                    : order.orderCount == 0
                        ? Center(
                            child: CustomText(
                              text: order.getOrder.message,
                              size: 18,
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: order
                                                    .getOrder.data.orderId
                                                    .toString(),
                                                color: mainColor,
                                                textAlign: TextAlign.start,
                                                size: 14.0,
                                              ),
                                              CustomText(
                                                text: order.getOrder.data.total
                                                    .toString(),
                                                color: mainColor,
                                                textAlign: TextAlign.start,
                                                size: 14.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: getOneOrder.orderCount);
              },
            ),
            CustomButton(
              text: 'الغاء الاوردر',
              onClick: () {
                addOrder.removeOrder(
                    addOrder.getOrder.data.orderId.toString(), context);
              },
            )
          ],
        ),
      ),
    );
  }
}
