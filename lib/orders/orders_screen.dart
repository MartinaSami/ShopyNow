import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/orders/get_one_order.dart';
import 'package:shopy_now/orders/orders_provider.dart';
import 'package:shopy_now/widgets/custom_button.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class OrdersScreen extends StatelessWidget {
  static const String id = 'OrdersScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var getAllOrders = Provider.of<OrdersProvider>(context, listen: false);
    getAllOrders.getData();
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
              text: 'اوردراتك',
              textAlign: TextAlign.center,
              size: 20,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Consumer<OrdersProvider>(
              builder: (ctx, orders, _) {
                return orders.getOrdersData == null
                    ? Center(child: CircularProgressIndicator())
                    : orders.count == 0
                        ? Center(
                            child: CustomText(
                              text: getAllOrders.getAllOrders.message,
                              size: 18,
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  orders.oneOrder(orders
                                      .getAllOrders.data[index].orderId
                                      .toString());
                                  Navigator.pushNamed(
                                      context, GetOneOrder.id, arguments: {
                                    'id':
                                        orders.getAllOrders.data[index].orderId
                                  });
                                },
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
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
                                                    text: orders.getAllOrders
                                                        .data[index].orderId
                                                        .toString(),
                                                    color: mainColor,
                                                    textAlign: TextAlign.start,
                                                    size: 14.0,
                                                  ),
                                                  CustomText(
                                                    text: orders.getAllOrders
                                                        .data[index].total,
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
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount:
                                Provider.of<OrdersProvider>(context).count);
              },
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(text: 'اللي بعده'),
          ],
        ),
      ),
    );
  }
}
