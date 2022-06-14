// To parse this JSON data, do
//
//     final scoreModel = scoreModelFromJson(jsonString);

import 'dart:convert';

ScoreModel scoreModelFromJson(String str) =>
    ScoreModel.fromJson(json.decode(str));

String scoreModelToJson(ScoreModel data) => json.encode(data.toJson());

class ScoreModel {
  ScoreModel({
    this.squads,
  });

  List<Squad>? squads;

  factory ScoreModel.fromJson(Map<String, dynamic> json) => ScoreModel(
        squads: List<Squad>.from(json["squads"].map((x) => Squad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "squads": List<dynamic>.from(squads!.map((x) => x.toJson())),
      };
}

class Squad {
  Squad({
    this.name,
    this.position,
    this.points,
  });

  String? name;
  Points? position;
  Points? points;

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
        name: json["name"],
        position: Points.fromJson(json["position"]),
        points: Points.fromJson(json["points"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "position": position?.toJson(),
        "points": points?.toJson(),
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
