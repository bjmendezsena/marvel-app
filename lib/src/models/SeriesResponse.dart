// To parse this JSON data, do
//
//     final seriesResponse = seriesResponseFromJson(jsonString);

import 'dart:convert';

import 'Serie.dart';

SeriesResponse seriesResponseFromJson(String str) =>
    SeriesResponse.fromJson(json.decode(str));

String seriesResponseToJson(SeriesResponse data) => json.encode(data.toJson());

class SeriesResponse {
  SeriesResponse({
    this.data,
  });
  Data data;

  factory SeriesResponse.fromJson(Map<String, dynamic> json) => SeriesResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.results,
  });

  List<Serie> results;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        results:
            List<Serie>.from(json["results"].map((x) => Serie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<Serie>.from(results.map((x) => x.toJson())),
      };
}
