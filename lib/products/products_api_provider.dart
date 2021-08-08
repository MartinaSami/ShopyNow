import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopy_now/products/products_model.dart';
import 'dart:convert' as convert;
import '../constants.dart';

class GetProducts extends ChangeNotifier {
  var count;
  Products homeProducts;
  get getProductData => homeProducts;
  Future getData() async {
    var response = await http.get(Uri.parse(kHost + kProducts));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      final Products products = Products.fromJson(data);
      homeProducts = products;
      count = products.data.length;

      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
