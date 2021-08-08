import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/cart/cart_api.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/fav/fav_api.dart';
import 'package:shopy_now/products/products_api_provider.dart';
import 'package:shopy_now/widgets/custom_text.dart';

class FavoriteScreen extends StatefulWidget {
  static const String id = 'FavoriteScreen';

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var fav = Provider.of<FavProvider>(context, listen: false);
    fav.getFavData();
    var products = Provider.of<GetProducts>(context);
    products.getData();
    var favProvider = Provider.of<FavProvider>(context, listen: false);
    favProvider.getFavData();
    var cart = Provider.of<AddToCart>(context, listen: false);
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
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Consumer<FavProvider>(
                builder: (ctx, favProvider, _) {
                  return favProvider.getCartsData == null
                      ? Center(child: CircularProgressIndicator())
                      : favProvider.count == 0
                          ? Center(
                              child: CustomText(
                                text: fav.getAllFavorites.message,
                                size: 18,
                              ),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                childAspectRatio: .8,
                              ),
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[100],
                                    ),
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            onTap: () => Navigator.pushNamed(
                                                context,
                                                favProvider.getAllFavorites
                                                    .data[index].id
                                                    .toString(),
                                                arguments: {
                                                  'productId': products
                                                      .homeProducts
                                                      .data[index]
                                                      .id
                                                }),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Image.network(
                                                favProvider.getAllFavorites
                                                    .data[index].imagePath,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
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
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    favProvider.removeFavorite(
                                                        favProvider
                                                            .getAllFavorites
                                                            .data[index]
                                                            .id
                                                            .toString(),
                                                        context);
                                                  },
                                                  child: Icon(
                                                    favProvider
                                                                .getAllFavorites
                                                                .data[index]
                                                                .favorite ==
                                                            '0'
                                                        ? Icons.favorite_outline
                                                        : Icons
                                                            .favorite_outlined,
                                                    size: 15,
                                                    color: secondaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            bottom: 5,
                                            left: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: CustomText(
                                      text: favProvider
                                          .getAllFavorites.data[index].name,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: secondaryColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: InkWell(
                                        onTap: () {
                                          cart.addRemoveIncreaseDecrease(
                                              favProvider.getAllFavorites
                                                  .data[index].id
                                                  .toString(),
                                              kAddToCart,
                                              context);
                                          print(products
                                              .homeProducts.data[index].id);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: favProvider.getAllFavorites
                                                  .data[index].price,
                                              color: Colors.white,
                                              size: 15,
                                              weight: FontWeight.normal,
                                            ),
                                            Icon(
                                              Icons.shopping_cart_outlined,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              itemCount: fav.count,
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
