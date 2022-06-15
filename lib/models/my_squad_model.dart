// To parse this JSON data, do
//
//     final mysquadModel = mysquadModelFromJson(jsonString);

import 'dart:convert';

MysquadModel mysquadModelFromJson(String str) =>
    MysquadModel.fromJson(json.decode(str));

String mysquadModelToJson(MysquadModel data) => json.encode(data.toJson());

class MysquadModel {
  MysquadModel({
    this.squad,
  });

  Squad? squad;

  factory MysquadModel.fromJson(Map<String, dynamic> json) => MysquadModel(
        squad: Squad.fromJson(json["squad"]),
      );

  Map<String, dynamic> toJson() => {
        "squad": squad!.toJson(),
      };
}

class Squad {
  Squad({
    this.name,
    this.description,
    this.position,
    this.points,
  });

  String? name;
  String? description;
  Points? position;
  Points? points;

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
        name: json["name"],
        description: json["description"],
        position: Points.fromJson(json["position"]),
        points: Points.fromJson(json["points"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "position": position!.toJson(),
        "points": points!.toJson(),
      };
}

class Points {
  Points({
    this.overall,
    this.culturals,
    this.spectrum,
  });

  int? overall;
  int? culturals;
  int? spectrum;

  factory Points.fromJson(Map<String, dynamic> json) => Points(
        overall: json["overall"],
        culturals: json["culturals"],
        spectrum: json["spectrum"],
      );

  Map<String, dynamic> toJson() => {
        "overall": overall,
        "culturals": culturals,
        "spectrum": spectrum,
      };
}
