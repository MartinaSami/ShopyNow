// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        message: json["Message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.availableNumber,
    this.rating,
    this.ratingsNumber,
    this.category,
    this.subCategoryName,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  String image;
  String price;
  String availableNumber;
  String rating;
  String ratingsNumber;
  String category;
  String subCategoryName;
  dynamic createdAt;
  dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        availableNumber: json["available_number"],
        rating: json["rating"],
        ratingsNumber: json["ratings_number"],
        category: json["category"],
        subCategoryName: json["sub_category_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "available_number": availableNumber,
        "rating": rating,
        "ratings_number": ratingsNumber,
        "category": category,
        "sub_category_name": subCategoryName,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
