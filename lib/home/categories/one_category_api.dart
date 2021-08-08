import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import 'get_one_category.dart';

class GetOneCategoryProvider extends ChangeNotifier {
  GetOneCategory list1;
  GetOneCategory list2;

  var oneCategoryCount;
  GetOneCategory oneCategoryData;

  get getOneCategoryData => oneCategoryData;

  var categoriesOfCategoryCount;
  GetOneCategory categoriesOfCategoryData;

  get getCategoriesOfCategoryData => categoriesOfCategoryData;

  Future oneCategoryFun(String id) async {
    var response = await http.get(Uri.parse(kHost + kGetOneCategory + '$id'));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      final GetOneCategory oneCategory = GetOneCategory.fromJson(data);
      oneCategoryData = oneCategory;
      notifyListeners();
      oneCategoryCount = oneCategory.data.length;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future categoriesOfCategory(String id) async {
    var response = await http.get(Uri.parse(kHost + kGetOneCategory + '$id'));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      final GetOneCategory categoriesOfCategory = GetOneCategory.fromJson(data);
      categoriesOfCategoryData = categoriesOfCategory;
      notifyListeners();
      categoriesOfCategoryCount = categoriesOfCategory.data.length;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
