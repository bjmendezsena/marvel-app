// To parse this JSON data, do
//
//     final creator = creatorFromJson(jsonString);

import 'dart:convert';

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

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  String path;
  String extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}
