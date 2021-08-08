// To parse this JSON data, do
//
//     final slider = sliderFromJson(jsonString);

import 'dart:convert';

Slider sliderFromJson(String str) => Slider.fromJson(json.decode(str));

String sliderToJson(Slider data) => json.encode(data.toJson());

class Slider {
  Slider({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
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
    this.id,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String imagePath;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        imagePath: json["image_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_path": imagePath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
