// To parse this JSON data, do
//
//     final getOrdersModel = getOrdersModelFromJson(jsonString);

import 'dart:convert';

GetOrdersModel getOrdersModelFromJson(String str) =>
    GetOrdersModel.fromJson(json.decode(str));

String getOrdersModelToJson(GetOrdersModel data) => json.encode(data.toJson());

class GetOrdersModel {
  GetOrdersModel({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory GetOrdersModel.fromJson(Map<String, dynamic> json) => GetOrdersModel(
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
    this.orderId,
    this.orderCode,
    this.total,
    this.date,
  });

  int orderId;
  String orderCode;
  String total;
  DateTime date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["order_id"],
        orderCode: json["order_code"],
        total: json["total"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_code": orderCode,
        "total": total,
        "date": date.toIso8601String(),
      };
}
