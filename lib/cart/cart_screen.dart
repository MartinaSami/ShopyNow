import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/cart/cart_api.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/widgets/custom_text.dart';
import '../orders/order_address.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var getAllCarts = Provider.of<AddToCart>(context, listen: false);
    getAllCarts.getData(CartScreen.id);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Consumer<AddToCart>(
                builder: (ctx, categoryProduct, _) {
                  return categoryProduct.getCartsData == null
                      ? Center(child: CircularProgressIndicator())
                      : categoryProduct.count == 0
                          ? Center(
                              child: CustomText(
                                text: getAllCarts.getAllCarts.message,
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
                                                  text: categoryProduct
                                                      .getAllCarts
                                                      .data[index]
                                                      .name,
                                                  color: mainColor,
                                                  textAlign: TextAlign.start,
                                                  size: 14.0,
                                                ),
                                                CustomText(
                                                  text: categoryProduct
                                                      .getAllCarts
                                                      .data[index]
                                                      .price,
                                                  color: mainColor,
                                                  textAlign: TextAlign.start,
                                                  size: 14.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Image.network(
                                              categoryProduct.getAllCarts
                                                  .data[index].image,
                                              width: 100,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    getAllCarts
                                                        .addRemoveIncreaseDecrease(
                                                            categoryProduct
                                                                .getAllCarts
                                                                .data[index]
                                                                .productId
                                                                .toString(),
                                                            kIncreaseCart,
                                                            context);
                                                  },
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.add_circle_outline,
                                                      color: secondaryColor,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  child: CustomText(
                                                    text: categoryProduct
                                                        .getAllCarts
                                                        .data[index]
                                                        .quantity,
                                                    color: mainColor,
                                                    size: 18,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    getAllCarts
                                                        .addRemoveIncreaseDecrease(
                                                            categoryProduct
                                                                .getAllCarts
                                                                .data[index]
                                                                .productId
                                                                .toString(),
                                                            kDecreaseCart,
                                                            context);
                                                  },
                                                  child: Container(
                                                    child: Icon(
                                                      Icons
                                                          .remove_circle_outline,
                                                      color: secondaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    getAllCarts
                                                        .addRemoveIncreaseDecrease(
                                                            categoryProduct
                                                                .getAllCarts
                                                                .data[index]
                                                                .productId
                                                                .toString(),
                                                            kRemoveOneCart,
                                                            context);
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: secondaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
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
                              itemCount: Provider.of<AddToCart>(context).count);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, OrderAddress.id);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: secondaryColor,
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Text(
                  'تأكيد',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
