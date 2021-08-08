import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy_now/api/api_manager.dart';
import 'package:shopy_now/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'fav_model.dart';

class FavProvider extends ChangeNotifier {
  var count;
  Favorite getAllFavorites;
  get getCartsData => getAllFavorites;
  Future getFavData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    var response = await http.get(Uri.parse(kHost + kGetFavorite), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      final Favorite favorites = Favorite.fromJson(data);
      getAllFavorites = favorites;
      count = favorites.data.length;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<Null> addFavorite(String id, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var body = {
      "id": id,
    };
    var response = await CallAPI().post(kHost + kAddFavorite, body, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    getFavData();
    if (response.statusCode == 200) {
      notifyListeners();
      Get.snackbar('Product', data['message'].toString());
    } else {
      Get.snackbar('Error', data['message'].toString());
    }
  }

  Future<Null> removeFavorite(String id, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var body = {
      "id": id,
    };
    var response =
        await CallAPI().post(kHost + kRemoveFavorite, body, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    getFavData();
    if (response.statusCode == 200) {
      notifyListeners();
      Get.snackbar('Product', data['message'].toString());
    } else {
      Get.snackbar('Error', data['message'].toString());
    }
  }
}
