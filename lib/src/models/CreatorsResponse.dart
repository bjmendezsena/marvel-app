// To parse this JSON data, do
//
//     final creatorsResponse = creatorsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:marvel_app/src/models/Creator.dart';

CreatorsResponse creatorsResponseFromJson(String str) =>
    CreatorsResponse.fromJson(json.decode(str));

String creatorsResponseToJson(CreatorsResponse data) =>
    json.encode(data.toJson());

class CreatorsResponse {
  CreatorsResponse({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  Data data;

  factory CreatorsResponse.fromJson(Map<String, dynamic> json) =>
      CreatorsResponse(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  int offset;
  int limit;
  int total;
  int count;
  List<Creator> results;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results:
            List<Creator>.from(json["results"].map((x) => Creator.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
