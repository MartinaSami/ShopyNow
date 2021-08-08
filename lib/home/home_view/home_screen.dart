import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/fav/fav_api.dart';
import 'package:shopy_now/home/categories/categories_api_provider.dart';
import 'package:shopy_now/home/categories/one_category_screen.dart';
import 'package:shopy_now/home/product_details/product_details.dart';
import 'package:shopy_now/home/slider/slider_api_provider.dart';
import 'package:shopy_now/products/products_api_provider.dart';
import 'package:shopy_now/search/search_view.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var slider = Provider.of<GetSlider>(context);
    slider.getData();
    var categories = Provider.of<GetCategories>(context);
    categories.getData();
    var products = Provider.of<GetProducts>(context);
    products.getData();
    var favProvider = Provider.of<FavProvider>(context, listen: false);
    favProvider.getFavData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Image.asset(
                'assets/icons/search-icon.png',
              ),
              filled: true,
              fillColor: Colors.grey[100],
              hintText: 'بتدور علي ايه..؟',
              hintStyle: TextStyle(
                color: mainColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, SearchScreen.id),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              height: height * 0.15,
              width: double.infinity,
              child: Consumer<GetSlider>(
                builder: (ctx, sliderProvider, _) {
                  return slider.getSliderData == null
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: 200,
                          child: Carousel(
                            images: [
                              for (int i = 0; i < slider.count; i++)
                                Image.network(
                                  sliderProvider.sliderImages.data[i].imagePath,
                                  fit: BoxFit.cover,
                                ),
                            ],
                            dotSize: 5,
                            dotSpacing: 10,
                            indicatorBgPadding: 3,
                            dotBgColor: Colors.transparent,
                            dotIncreaseSize: 1.5,
                            animationDuration: Duration(seconds: 1),
                            dotVerticalPadding: 5,
                          ),
                        );
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Align(
              alignment: Alignment.topRight,
              child: CustomText(
                text: 'العناصر',
                size: 13,
              ),
            ),
            Container(
              height: height * 0.15,
              child: categories.getCategoriesData == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Consumer<GetCategories>(
                          builder: (ctx, categoriesProvider, _) {
                            return categories.categoriesData == null
                                ? Center(child: CircularProgressIndicator())
                                : InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return OneCategoryScreen(
                                          categoryId: categoriesProvider
                                              .categoriesData.data[index].id
                                              .toString(),
                                          categoryName: categoriesProvider
                                              .categoriesData.data[index].name,
                                        );
                                      }));
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            categoriesProvider.categoriesData
                                                .data[index].imagePath,
                                            width: width * 0.15,
                                            height: height * 0.1,
                                          ),
                                          CustomText(
                                            text: categoriesProvider
                                                .categoriesData
                                                .data[index]
                                                .name,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                          },
                        );
                      },
                      itemCount: categories.count,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                    ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CustomText(
                text: 'المنتجات',
                size: 13,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              child: Consumer<GetProducts>(
                builder: (ctx, productsProvider, _) {
                  return products.getProductData == null
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Center(
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context, ProductDetails.id,
                                            arguments: {
                                              'productId': products
                                                  .homeProducts.data[index].id
                                            }),
                                        child: Image.network(
                                          productsProvider.homeProducts
                                              .data[index].imagePath,
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
                                                if (productsProvider
                                                        .homeProducts
                                                        .data[index]
                                                        .favorite ==
                                                    '0') {
                                                  favProvider.addFavorite(
                                                      productsProvider
                                                          .homeProducts
                                                          .data[index]
                                                          .id
                                                          .toString(),
                                                      context);
                                                  products.getData();
                                                } else if (productsProvider
                                                        .homeProducts
                                                        .data[index]
                                                        .favorite ==
                                                    '1') {
                                                  favProvider.removeFavorite(
                                                      productsProvider
                                                          .homeProducts
                                                          .data[index]
                                                          .id
                                                          .toString(),
                                                      context);
                                                  products.getData();
                                                }
                                              },
                                              child: Icon(
                                                productsProvider
                                                            .homeProducts
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
                                    .homeProducts.data[index].rating),
                                minRating: 1,
                                itemSize: 15,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (double value) {},
                              ),
                              CustomText(
                                text: productsProvider
                                    .homeProducts.data[index].name,
                                size: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: productsProvider
                                        .homeProducts.data[index].price,
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
                          itemCount: products.count,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.9,
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
