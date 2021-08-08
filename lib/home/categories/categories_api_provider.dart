import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy_now/home/categories/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:shopy_now/home/categories/get_one_category.dart';
import 'dart:convert' as convert;
import '../../constants.dart';

class GetCategories extends ChangeNotifier {
  int count = 0;
  Categories categoriesData;
  get getCategoriesData => categoriesData;

  int oneCategoryCount = 0;
  GetOneCategory oneCategoryData;
  get getOneCategoryData => oneCategoryData;
  Future getData() async {
    var response = await http.get(Uri.parse(kHost + kCategory));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      final Categories categories = Categories.fromJson(data);
      categoriesData = categories;
      notifyListeners();
      count = categories.data.length;

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


}
