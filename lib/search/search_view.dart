import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/fav/fav_api.dart';
import 'package:shopy_now/products/products_api_provider.dart';
import 'package:shopy_now/search/provider/search_provider.dart';
import 'package:shopy_now/widgets/custom_text.dart';

import '../constants.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    // var search = Provider.of<CategoryProvider>(context, listen: false);
    // search.callAPIForProductData(text);
    var favProvider = Provider.of<FavProvider>(context, listen: false);
    favProvider.getFavData();
    var products = Provider.of<GetProducts>(context);
    products.getData();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'صفحة البحث',
          ),
          iconTheme: IconThemeData(
            color: secondaryColor, //change your color here
          ),
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: 'بتدور علي ايه..؟',
                  hintStyle: TextStyle(
                    color: mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                  final categoriesData =
                      Provider.of<SearchProvider>(context, listen: false);
                  categoriesData.callAPIForProductData(text);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Consumer<SearchProvider>(
                  builder: (ctx, categoryProvider, _) {
                    return ListView.separated(
                      itemBuilder: (_, int index) {
                        return categoryProvider.getProductData == null
                            ? CustomText(
                                text: '',
                              )
                            : categoryProvider.count == 0
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                        child: Text(
                                            'No data in search about $text')),
                                  )
                                : Container(
                                    height: 200,
                                    child: Consumer<GetProducts>(
                                      builder: (ctx, categoryProvider, _) {
                                        return categoryProvider
                                                    .getProductData ==
                                                null
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : GridView.builder(
                                                itemBuilder: (context, index) =>
                                                    Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Center(
                                                        child: Stack(
                                                          children: [
                                                            Image.network(
                                                              categoryProvider
                                                                  .homeProducts
                                                                  .data[index]
                                                                  .imagePath,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Positioned(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              secondaryColor,
                                                                        )),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          3.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      if (categoryProvider
                                                                              .homeProducts
                                                                              .data[index]
                                                                              .favorite ==
                                                                          '0') {
                                                                        favProvider.addFavorite(
                                                                            categoryProvider.homeProducts.data[index].id.toString(),
                                                                            context);
                                                                        products
                                                                            .getData();
                                                                      } else if (categoryProvider
                                                                              .homeProducts
                                                                              .data[index]
                                                                              .favorite ==
                                                                          '1') {
                                                                        favProvider.removeFavorite(
                                                                            categoryProvider.homeProducts.data[index].id.toString(),
                                                                            context);
                                                                        products
                                                                            .getData();
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      categoryProvider.homeProducts.data[index].favorite ==
                                                                              '0'
                                                                          ? Icons
                                                                              .favorite_outline
                                                                          : Icons
                                                                              .favorite_outlined,
                                                                      size: 15,
                                                                      color:
                                                                          secondaryColor,
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
                                                      initialRating:
                                                          double.parse(
                                                              categoryProvider
                                                                  .homeProducts
                                                                  .data[index]
                                                                  .rating),
                                                      minRating: 1,
                                                      itemSize: 15,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 0),
                                                      itemBuilder:
                                                          (context, _) => Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate:
                                                          (double value) {},
                                                    ),
                                                    CustomText(
                                                      text: categoryProvider
                                                          .homeProducts
                                                          .data[index]
                                                          .name,
                                                      size: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomText(
                                                          text: categoryProvider
                                                              .homeProducts
                                                              .data[index]
                                                              .price,
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
                                                itemCount:
                                                    categoryProvider.count,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10,
                                                  childAspectRatio: 0.9,
                                                ),
                                              );
                                      },
                                    ),
                                  );
                      },
                      itemCount: categoryProvider.count == 0
                          ? 1
                          : categoryProvider.count,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
