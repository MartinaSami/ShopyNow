import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';

Future<Null> logOut(
    BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String token = sharedPreferences.getString('token');

  var response = await http.post(Uri.parse(kHost + kLogOut), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });
  var data = json.decode(response.body);
  if (response.statusCode == 200) {
    print(data['message']);
  }
}