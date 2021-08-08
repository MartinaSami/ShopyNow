import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/fav/fav_api.dart';
import 'package:shopy_now/home/categories/product_by_category_api.dart';
import 'package:shopy_now/products/products_api_provider.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class CategoriesOfCategoriesNum2 extends StatelessWidget {
  String categoryName;
  String categoryId;

  CategoriesOfCategoriesNum2({
    this.categoryName,
    this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var productsFinal = Provider.of<GetProductByCategory>(context);
    productsFinal.getData(categoryId);
    var products = Provider.of<GetProducts>(context);
    products.getData();
    var favProvider = Provider.of<FavProvider>(context, listen: false);
    favProvider.getFavData();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: categoryName,
        ),
        iconTheme: IconThemeData(
          color: secondaryColor, //change your color here
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
      ),
      body: ListView(children: [
        SizedBox(
          child: Consumer<GetProductByCategory>(
            builder: (ctx, productsProvider, _) {
              return productsProvider.getProductData == null
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Center(
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.pushNamed(
                                          context,
                                          productsProvider.subProducts
                                              .data[index].categoryId,
                                          arguments: {
                                            'productId': productsProvider
                                                .subProducts.data[index].id
                                          }),
                                      child: Image.network(
                                        productsProvider
                                            .subProducts.data[index].imagePath,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: secondaryColor,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: InkWell(
                                            onTap: () {
                                              if (productsProvider.subProducts
                                                      .data[index].favorite ==
                                                  '0') {
                                                favProvider.addFavorite(
                                                    productsProvider.subProducts
                                                        .data[index].id
                                                        .toString(),
                                                    context);
                                                products.getData();
                                              } else if (productsProvider
                                                      .subProducts
                                                      .data[index]
                                                      .favorite ==
                                                  '1') {
                                                favProvider.removeFavorite(
                                                    productsProvider.subProducts
                                                        .data[index].id
                                                        .toString(),
                                                    context);
                                                products.getData();
                                              }
                                            },
                                            child: Icon(
                                              productsProvider
                                                          .subProducts
                                                          .data[index]
                                                          .favorite ==
                                                      '0'
                                                  ? Icons.favorite_outline
                                                  : Icons.favorite_outlined,
                                              size: 15,
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      bottom: 0,
                                      right: 0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            // starts
                            RatingBar.builder(
                              initialRating: double.parse(productsProvider
                                  .subProducts.data[index].rating),
                              minRating: 1,
                              itemSize: 15,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                            CustomText(
                              text:
                                  productsProvider.subProducts.data[index].name,
                              size: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: productsProvider
                                      .subProducts.data[index].price,
                                  size: 10,
                                ),
                                CustomText(
                                  text: ' EGP',
                                  size: 10,
                                  color: secondaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      itemCount: productsFinal.count,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                    );
            },
          ),
        ),
      ]),
    );
  }
}
