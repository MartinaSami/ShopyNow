import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/cart/cart_screen.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/home/categories/one_category_api.dart';
import 'package:shopy_now/home/product_details/product_details_api.dart';
import 'package:shopy_now/home/slider/slider_api_provider.dart';
import 'package:shopy_now/rating/rating_screen.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class ProductDetails extends StatefulWidget {
  static const String id = 'ProductDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    var productId = arguments['productId'];
    print(arguments['productId']);
    var getOneProduct = Provider.of<GetOneProduct>(context);
    getOneProduct.getData(productId);
    var slider = Provider.of<GetSlider>(context);
    slider.getData();
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
      bottomNavigationBar: InkWell(
        onTap: () {
          return showGeneralDialog(
            context: context,
            barrierDismissible: true,
            transitionDuration: Duration(milliseconds: 500),
            barrierLabel: MaterialLocalizations.of(context).dialogLabel,
            barrierColor: Colors.black.withOpacity(0.5),
            pageBuilder: (context, _, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SafeArea(
                    child: Container(
                        child: Material(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image.asset('assets/images/appbar-logo.png'),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Consumer<GetOneProduct>(
                                        builder: (ctx, categoryProduct, _) {
                                          return categoryProduct
                                                      .getOneProductData ==
                                                  null
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : CustomText(
                                                  text:
                                                      'لاب توب ابل ماك بوك برو',
                                                );
                                        },
                                      ),
                                    ),
                                    CustomText(
                                      text: 'تم اضافته للعربه',
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: ' اجمالي المبلغ',
                                    ),
                                    CustomText(
                                      text: ' 100 ج.م',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: secondaryColor,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: CustomText(
                                        text: 'هكمل تسوق',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )),
                                Expanded(
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        child: CartScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: secondaryColor,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: CustomText(
                                        text: ' هطلب دلوقتي',
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                  ),
                ],
              );
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ).drive(Tween<Offset>(
                  begin: Offset(0, -1.0),
                  end: Offset.zero,
                )),
                child: child,
              );
            },
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: secondaryColor,
          height: height * 0.08,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 20,
                color: secondaryColor,
              ),
              CustomText(
                text: 'اضف للعربه',
                size: 18,
                color: Colors.white,
              ),
              Icon(
                Icons.shopping_cart_outlined,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.25,
                      width: double.infinity,
                      child: Consumer<GetOneCategoryProvider>(
                        builder: (ctx, oneCategory, _) {
                          return slider.getSliderData == null
                              ? Center(child: CircularProgressIndicator())
                              : Container(
                            height: 200,
                            child: Carousel(
                              images: [
                                for (int i = 0; i < slider.count; i++)
                                  Image.network(
                                    oneCategory.oneCategoryData.data[i].imagePath,
                                    fit: BoxFit.cover,
                                  ),
                              ],
                              dotSize: 8,
                              dotSpacing: 18,
                              dotColor: Color(0xff707070),
                              indicatorBgPadding: 5,
                              dotBgColor: Colors.white,
                              dotIncreasedColor: secondaryColor,
                              dotIncreaseSize: 1.2,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Consumer<GetOneProduct>(builder: (ctx, productDetails, _){
                      return productDetails.getOneProductData == null ? Center(child: CircularProgressIndicator()) : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: getOneProduct.oneProductData.data.name
                                .toString(),
                            size: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: secondaryColor,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: CustomText(
                              text: getOneProduct.oneProductData.data.price
                                  .toString(),
                              size: 17,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                      height: height * 0.05,
                      ),
                      CustomText(
                      text: 'التفاصيل',
                      color: secondaryColor,
                      size: 16,
                      ),
                      CustomText(
                      text: getOneProduct.oneProductData.data.description
                          .toString(),
                      size: 16,
                      ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        InkWell(
                          onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return RatingScreen(5.toString());
                        }));
                      },
                          child: CustomText(
                            text: 'التقييمات',
                            color: secondaryColor,
                            size: 16,
                          ),
                        ),
                      SizedBox(
                      height: height * 0.05,
                      ),
                      ],
                      );
                    })


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
