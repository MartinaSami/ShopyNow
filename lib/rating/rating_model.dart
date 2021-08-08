// To parse this JSON data, do
//
//     final getRatingModel = getRatingModelFromJson(jsonString);

import 'dart:convert';

GetRatingModel getRatingModelFromJson(String str) => GetRatingModel.fromJson(json.decode(str));

String getRatingModelToJson(GetRatingModel data) => json.encode(data.toJson());

class GetRatingModel {
  GetRatingModel({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory GetRatingModel.fromJson(Map<String, dynamic> json) => GetRatingModel(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.name,
    this.rate,
    this.content,
  });

  String name;
  String rate;
  String content;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    rate: json["rate"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "rate": rate,
    "content": content,
  };
}
