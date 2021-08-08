import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy_now/api/api_manager.dart';
import '../constants.dart';
import '../main.dart';

class Auth extends ChangeNotifier {
  // this method for Login
  Future<Null> userLogin(String email, password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var body = {"email": email, "password": password};
    var response = await CallAPI().post(
      kHost + kLogin,
      body,
    );
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      String token = data['token'];
      sharedPreferences.setString('token', token);
      print(token);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Get.snackbar('Error Message', data['message'].toString());
    }
  }

  Future<Null> userRegister(
      String name, email, password, mobile, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var body = {
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
      "password confirmation": password
    };
    var response = await CallAPI().post(
      kHost + kRegister,
      body,
    );
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      String token = data['token'];
      sharedPreferences.setString('token', token);
      print(token);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Get.snackbar('Error Message', data['error_message'].toString());
    }
  }
}
