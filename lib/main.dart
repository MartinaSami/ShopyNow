import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shopy_now/auth/forget_password/new_password.dart';
import 'package:shopy_now/cart/cart_api.dart';
import 'package:shopy_now/constants.dart';
import 'package:shopy_now/fav/fav_api.dart';
import 'package:shopy_now/home/categories/categories_api_provider.dart';
import 'package:shopy_now/home/categories/one_category_api.dart';
import 'package:shopy_now/home/categories/one_category_screen.dart';
import 'package:shopy_now/home/categories/product_by_category_api.dart';
import 'package:shopy_now/home/product_details/product_details_api.dart';
import 'package:shopy_now/orders/orders_provider.dart';
import 'package:shopy_now/products/products_api_provider.dart';
import 'package:shopy_now/products/products_screen.dart';
import 'package:shopy_now/rating/rating_api.dart';
import 'package:shopy_now/search/provider/search_provider.dart';
import 'package:shopy_now/search/search_view.dart';
import 'auth/auth_api.dart';
import 'auth/forget_password/forget_password.dart';
import 'auth/forget_password/forget_password_code.dart';
import 'auth/login/login_screen.dart';
import 'auth/signup/interests_screen.dart';
import 'auth/signup/location_screen.dart';
import 'auth/signup/phoneAuth_screen.dart';
import 'auth/signup/signup_screen.dart';
import 'cart/cart_screen.dart';
import 'cart/continue_order.dart';
import 'cart/continue_order_with_visa_number.dart';
import 'orders/get_one_order.dart';
import 'orders/order_address.dart';
import 'cart/visa_payment.dart';
import 'fav/favorite_screen.dart';
import 'filter/dell_filter.dart';
import 'filter/filter_list.dart';
import 'filter/filter_page.dart';
import 'filter/laptop_filter.dart';
import 'filter/price_filter.dart';
import 'filter/recently_arrived.dart';
import 'home/home_view/home_screen.dart';
import 'home/product_details/product_details.dart';
import 'home/slider/slider_api_provider.dart';
import 'more/address/info_view.dart';
import 'more/cash_back/cash_back_screen.dart';
import 'more/fav/more_favorite_screen.dart';
import 'more/more_screen/more_screen.dart';
import 'more/orders/order_menu.dart';
import 'orders/orders_screen.dart';
import 'more/payment/payment_bill.dart';
import 'more/payment/payment_page.dart';
import 'more/personal/personal_screen.dart';
import 'more/recovery/order_request.dart';
import 'more/recovery/recovery_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Auth>(
      create: (context) => Auth(),
    ),
    ChangeNotifierProvider<SearchProvider>(
      create: (context) => SearchProvider(),
    ),
    ChangeNotifierProvider<GetSlider>(
      create: (context) => GetSlider(),
    ),
    ChangeNotifierProvider<GetCategories>(
      create: (context) => GetCategories(),
    ),
    ChangeNotifierProvider<GetProducts>(
      create: (context) => GetProducts(),
    ),
    ChangeNotifierProvider<GetOneProduct>(
      create: (context) => GetOneProduct(),
    ),
    ChangeNotifierProvider<AddToCart>(
      create: (context) => AddToCart(),
    ),
    ChangeNotifierProvider<FavProvider>(
      create: (context) => FavProvider(),
    ),
    ChangeNotifierProvider<OrdersProvider>(
      create: (context) => OrdersProvider(),
    ),
    ChangeNotifierProvider<GetOneCategoryProvider>(
      create: (context) => GetOneCategoryProvider(),
    ),
    ChangeNotifierProvider<GetProductByCategory>(
      create: (context) => GetProductByCategory(),
    ),
    ChangeNotifierProvider<GetRatingsApi>(
      create: (context) => GetRatingsApi(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      home: HomeScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LocationScreen.id: (context) => LocationScreen(),
        PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
        ProductDetails.id: (context) => ProductDetails(),
        InterestScreen.id: (context) => InterestScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        MyHomePage.id: (context) => MyHomePage(),
        ProductsScreen.id: (context) => ProductsScreen(),
        CartScreen.id: (context) => CartScreen(),
        PersonalScreen.id: (context) => PersonalScreen(),
        OrdersScreen.id: (context) => OrdersScreen(),
        RecoveryScreen.id: (context) => RecoveryScreen(),
        CashBackScreen.id: (context) => CashBackScreen(),
        FavoriteScreen.id: (context) => FavoriteScreen(),
        MoreFavoriteScreen.id: (context) => MoreFavoriteScreen(),
        OrderRequest.id: (context) => OrderRequest(),
        DellFilter.id: (context) => DellFilter(),
        FilterList.id: (context) => FilterList(),
        FilterPage.id: (context) => FilterPage(),
        LaptopFilter.id: (context) => LaptopFilter(),
        PriceFilter.id: (context) => PriceFilter(),
        RecentlyArrived.id: (context) => RecentlyArrived(),
        ContinueOrder.id: (context) => ContinueOrder(),
        ContinueOrderWithVisaNumber.id: (context) =>
            ContinueOrderWithVisaNumber(),
        VisaPayment.id: (context) => VisaPayment(),
        OrderMenu.id: (context) => OrderMenu(),
        InfoView.id: (context) => InfoView(),
        PaymentPage.id: (context) => PaymentPage(),
        PaymentBill.id: (context) => PaymentBill(),
        ForgetPassword.id: (context) => ForgetPassword(),
        ForgetPasswordCode.id: (context) => ForgetPasswordCode(),
        NewPassword.id: (context) => NewPassword(),
        SearchScreen.id: (context) => SearchScreen(),
        OrderAddress.id: (context) => OrderAddress(),
        GetOneOrder.id: (context) => GetOneOrder(),
        OneCategoryScreen.id: (context) => OneCategoryScreen(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String id = 'MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
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
            label: 'الرئيسيه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'المفضله',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'المنتجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'العربه',
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
