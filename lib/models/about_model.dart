// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromJson(jsonString);

import 'dart:convert';

AboutModel aboutModelFromJson(String str) =>
    AboutModel.fromJson(json.decode(str));

String aboutModelToJson(AboutModel data) => json.encode(data.toJson());

class AboutModel {
  AboutModel({
    this.aboutUsContent,
  });

  AboutUsContent? aboutUsContent;

  factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
        aboutUsContent: AboutUsContent.fromJson(json["aboutUsContent"]),
      );

  Map<String, dynamic> toJson() => {
        "aboutUsContent": aboutUsContent!.toJson(),
      };
}

class AboutUsContent {
  AboutUsContent({
    this.aboutAaveg,
    this.cup1,
    this.cup2,
    this.cup3,
  });

  String? aboutAaveg;
  Cup? cup1;
  Cup? cup2;
  Cup? cup3;

  factory AboutUsContent.fromJson(Map<String, dynamic> json) => AboutUsContent(
        aboutAaveg: json["aboutAaveg"],
        cup1: Cup.fromJson(json["cup1"]),
        cup2: Cup.fromJson(json["cup2"]),
        cup3: Cup.fromJson(json["cup3"]),
      );

  Map<String, dynamic> toJson() => {
        "aboutAaveg": aboutAaveg,
        "cup1": cup1!.toJson(),
        "cup2": cup2!.toJson(),
        "cup3": cup3!.toJson(),
      };
}

class Cup {
  Cup({
    this.vector,
    this.description,
  });

  String? vector;
  String? description;

  factory Cup.fromJson(Map<String, dynamic> json) => Cup(
        vector: json["vector"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "vector": vector,
        "description": description,
      };
}
