// To parse this JSON data, do
//
//     final getAllCarts = getAllCartsFromJson(jsonString);

import 'dart:convert';

GetAllCarts getAllCartsFromJson(String str) =>
    GetAllCarts.fromJson(json.decode(str));

String getAllCartsToJson(GetAllCarts data) => json.encode(data.toJson());

class GetAllCarts {
  GetAllCarts({
    this.message,
    this.data,
    this.total,
  });

  String message;
  List<Datum> data;
  int total;

  factory GetAllCarts.fromJson(Map<String, dynamic> json) => GetAllCarts(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class Datum {
  Datum({
    this.productId,
    this.name,
    this.price,
    this.quantity,
    this.total,
    this.image,
  });

  int productId;
  String name;
  String price;
  String quantity;
  String total;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "price": price,
        "quantity": quantity,
        "total": total,
        "image": image,
      };
}
