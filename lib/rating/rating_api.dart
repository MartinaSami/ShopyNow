import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy_now/rating/rating_model.dart';
import 'dart:convert' as convert;
import '../constants.dart';

class GetRatingsApi extends ChangeNotifier {

  var count;
  GetRatingModel productsRating;
  get getProductData => productsRating;
  Future getData(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var response = await http.get(Uri.parse(kHost + kGetRating + id), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      final GetRatingModel products = GetRatingModel.fromJson(data);
      productsRating = products;
      count = products.data.length;

      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}