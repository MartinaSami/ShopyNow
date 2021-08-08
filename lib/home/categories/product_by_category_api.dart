import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopy_now/home/categories/product_by_category_model.dart';
import 'dart:convert' as convert;
import '../../constants.dart';

class GetProductByCategory extends ChangeNotifier {
  var count;
  ProductByCategory subProducts;
  get getProductData => subProducts;
  Future getData(String id) async {
    var response = await http.get(Uri.parse(kHost + kGetProductsByCategory + '$id'));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      final ProductByCategory products = ProductByCategory.fromJson(data);
      subProducts = products;
      count = products.data.length;

      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}