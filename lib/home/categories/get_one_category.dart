// To parse this JSON data, do
//
//     final getOneCategory = getOneCategoryFromJson(jsonString);

import 'dart:convert';

GetOneCategory getOneCategoryFromJson(String str) => GetOneCategory.fromJson(json.decode(str));

String getOneCategoryToJson(GetOneCategory data) => json.encode(data.toJson());

class GetOneCategory {
  GetOneCategory({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory GetOneCategory.fromJson(Map<String, dynamic> json) => GetOneCategory(
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
    this.name,
    this.parentId,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String parentId;
  String imagePath;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    parentId: json["parent_id"],
    imagePath: json["image_path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "parent_id": parentId,
    "image_path": imagePath,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
