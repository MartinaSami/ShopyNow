import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy_now/api/api_manager.dart';
import 'package:shopy_now/orders/get_orders_model.dart';
import 'package:shopy_now/orders/orders_screen.dart';
import '../constants.dart';
import 'get_one_order_model.dart';

class OrdersProvider extends ChangeNotifier {
  var count;
  var orderCount;

  GetOrdersModel getAllOrders;
  get getOrdersData => getAllOrders;

  GetOneOrderModel getOrder;
  get getOrderData => getOrder;

  Future getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    var response = await http.get(Uri.parse(kHost + kGetOrders), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      final GetOrdersModel products = GetOrdersModel.fromJson(data);
      getAllOrders = products;
      count = products.data.length;
      print(count);
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future oneOrder(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    var response = await http.get(Uri.parse(kHost + kGetOrder + id), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      final GetOneOrderModel orders = GetOneOrderModel.fromJson(data);
      getOrder = orders;
      orderCount = orders.data.products.length;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<Null> addOrder(String address, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var body = {
      "address": address,
    };
    var response = await CallAPI().post(kHost + kAddOrder, body, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    getData();
    if (response.statusCode == 200) {
      notifyListeners();
      Get.snackbar('Product', data['message'].toString());
      print('Add Order Api is Working');
    } else {
      Get.snackbar('Error', data['message'].toString());
      print('Add Order Api is NOT Working');
    }
  }

  Future<Null> removeOrder(String id, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    var body = {'id': id};

    var response =
        await http.post(Uri.parse(kHost + kRemoveOrder), body: body, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      notifyListeners();
      Get.snackbar('Product', data['message'].toString());
      Navigator.pushNamed(context, OrdersScreen.id);
      getData();
      print('Remove Order Api is Working');
    } else {
      Get.snackbar('Error', data['message'].toString());
      print('Remove Order Api is NOT Working');
    }
  }
}
