import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopy_now/search/model/model.dart';

class SearchProvider with ChangeNotifier {
  int count = 0;
  Category list;
  get getProductData => list;
  Future callAPIForProductData(String text) async {
    notifyListeners();
    http.Response response = await http.get(
      Uri.parse('https://bitna.club/api/product/search/$text'),
    );

    notifyListeners();
    list = Category.fromJson(
      json.decode(response.body),
    );

    count = list.data.length;
    return list;
  }
}
