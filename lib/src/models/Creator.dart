// To parse this JSON data, do
//
//     final creator = creatorFromJson(jsonString);

import 'dart:convert';

import 'Thumbnail.dart';

Creator creatorFromJson(String str) => Creator.fromJson(json.decode(str));

String creatorToJson(Creator data) => json.encode(data.toJson());

class Creator {
  Creator({
    this.fullName,
    this.thumbnail,
  });

  String fullName;
  Thumbnail thumbnail;

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        fullName: json["fullName"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "thumbnail": thumbnail.toJson(),
      };
}
