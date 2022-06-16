// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

EventDetail eventDetailFromJson(String str) =>
    EventDetail.fromJson(json.decode(str));

String eventDetailToJson(EventDetail data) => json.encode(data.toJson());

class EventDetail {
  EventDetail({
    this.name,
    this.description,
    this.cluster,
    this.cup,
    this.ruleBookLink,
    this.imageLink,
    this.rounds,
    this.isCompleted,
  });

  String? name;
  String? description;
  String? cluster;
  String? cup;
  String? ruleBookLink;
  String? imageLink;
  List<DateTime>? rounds;
  bool? isCompleted;

  factory EventDetail.fromJson(Map<String, dynamic> json) => EventDetail(
        name: json["name"],
        description: json["description"],
        cluster: json["cluster"],
        cup: json["cup"],
        ruleBookLink: json["ruleBookLink"],
        imageLink: json["imageLink"],
        rounds:
            List<DateTime>.from(json["rounds"].map((x) => DateTime.parse(x))),
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "cluster": cluster,
        "cup": cup,
        "ruleBookLink": ruleBookLink,
        "imageLink": imageLink,
        "rounds": List<dynamic>.from(rounds!.map((x) => x.toIso8601String())),
        "isCompleted": isCompleted,
      };
}
