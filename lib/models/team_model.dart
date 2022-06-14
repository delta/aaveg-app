// To parse this JSON data, do
//
//     final teamModel = teamModelFromJson(jsonString);

import 'dart:convert';

TeamModel teamModelFromJson(String str) => TeamModel.fromJson(json.decode(str));

String teamModelToJson(TeamModel data) => json.encode(data.toJson());

class TeamModel {
  TeamModel({
    this.teamsData,
  });

  List<TeamsDatum>? teamsData;

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        teamsData: List<TeamsDatum>.from(
            json["teamsData"].map((x) => TeamsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teamsData": List<dynamic>.from(teamsData!.map((x) => x.toJson())),
      };
}

class TeamsDatum {
  TeamsDatum({
    this.name,
    this.desc,
    this.members,
  });

  Name? name;
  String? desc;
  List<Member>? members;

  factory TeamsDatum.fromJson(Map<String, dynamic> json) => TeamsDatum(
        name: nameValues.map![json["name"]],
        desc: json["desc"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "desc": desc,
        "members": List<dynamic>.from(members!.map((x) => x.toJson())),
      };
}

class Member {
  Member({
    this.name,
    this.rollNo,
    this.team,
  });

  String? name;
  int? rollNo;
  Name? team;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        name: json["name"],
        rollNo: json["rollNo"],
        team: nameValues.map![json["team"]],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rollNo": rollNo,
        "team": nameValues.reverse[team],
      };
}

enum Name { EMPTY, WEB_OPS, CONTENT, DESIGN, OC, CORE }

final nameValues = EnumValues({
  "Content": Name.CONTENT,
  "Core": Name.CORE,
  "Design": Name.DESIGN,
  "": Name.EMPTY,
  "OC": Name.OC,
  "WebOps": Name.WEB_OPS
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
