import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopy_now/home/product_details/product_details_model.dart';
import 'dart:convert' as convert;
import '../../constants.dart';

class GetOneProduct extends ChangeNotifier {
  OneProduct oneProductData;
  get getOneProductData => oneProductData;
  Future getData(id) async {
    var response = await http.get(Uri.parse(kHost + kOneProduct + '$id'));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      final OneProduct oneProduct = OneProduct.fromJson(data);
      oneProductData = oneProduct;
      notifyListeners();
      print(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
