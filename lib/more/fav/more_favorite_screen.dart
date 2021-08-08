import 'package:flutter/material.dart';
import 'package:shopy_now/cart/cart_screen.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/fav/favorite_screen.dart';
import 'package:shopy_now/home/home_view/home_screen.dart';
import 'package:shopy_now/more/more_screen/more_screen.dart';
import 'package:shopy_now/products/products_screen.dart';

class MoreFavoriteScreen extends StatefulWidget {
  static const String id = 'MoreFavoriteScreen';
  @override
  _MoreFavoriteScreenState createState() => _MoreFavoriteScreenState();
}

class _MoreFavoriteScreenState extends State<MoreFavoriteScreen> {
  int currentIndex = 1;
  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProductsScreen(),
    CartScreen(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'المنتجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'العربة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'المزيد',
          ),
        ],
        selectedItemColor: secondaryColor,
        selectedIconTheme: IconThemeData(color: secondaryColor),
        selectedLabelStyle: TextStyle(color: secondaryColor),
      ),
    );
  }
}
