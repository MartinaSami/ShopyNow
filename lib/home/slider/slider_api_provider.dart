import 'package:flutter/cupertino.dart';
import 'package:shopy_now/home/slider/slider_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../constants.dart';

class GetSlider extends ChangeNotifier {
  int count = 0;
  Slider sliderImages;
  get getSliderData => sliderImages;
  Future getData() async {
    var response = await http.get(Uri.parse(kHost + kSlider));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);

      final Slider slider = Slider.fromJson(data);
      sliderImages = slider;
      notifyListeners();
      count = slider.data.length;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
