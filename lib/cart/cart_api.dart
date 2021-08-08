import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy_now/api/api_manager.dart';
import 'package:shopy_now/cart/get_all_carts_model.dart';
import 'package:shopy_now/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AddToCart extends ChangeNotifier {
  var count;
  GetAllCarts getAllCarts;
  get getCartsData => getAllCarts;
  Future getData(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    var response = await http.get(Uri.parse(kHost + kGetAllCarts), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      final GetAllCarts products = GetAllCarts.fromJson(data);
      getAllCarts = products;
      count = products.data.length;
      print(count);
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<Null> addRemoveIncreaseDecrease(
      String id, String url, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var body = {
      "id": id,
    };
    var response = await CallAPI().post(kHost + url, body, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      notifyListeners();
      Get.snackbar('Product', data['message'].toString());
    } else {
      Get.snackbar('Error', data['message'].toString());
    }
  }
}
