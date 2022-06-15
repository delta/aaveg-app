import 'dart:convert';

EventsModel eventsModelFromJson(String str) =>
    EventsModel.fromJson(json.decode(str));

Event eventModelFromJson(String str) => Event.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  EventsModel({
    this.events,
  });

  List<Event>? events;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events!.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    this.name,
    this.cluster,
    this.imageLink,
    this.rulebookLink,
    this.description,
    this.cup,
    this.rounds,
    this.isCompleted,
    this.id,
  });

  String? name;
  String? cluster;
  String? imageLink;
  String? rulebookLink;
  String? description;
  String? cup;
  List<DateTime>? rounds;
  bool? isCompleted;
  String? id;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        name: json["name"],
        cluster: json["cluster"] == null ? null : json["cluster"],
        imageLink: json["imageLink"],
        rulebookLink: json["ruleBookLink"],
        description: json["description"],
        cup: json["cup"],
        rounds:
            List<DateTime>.from(json["rounds"].map((x) => DateTime.parse(x))),
        isCompleted: json["isCompleted"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "cluster": cluster == null ? null : cluster,
        "imageLink": imageLink,
        "rounds": List<dynamic>.from(rounds!.map((x) => x.toIso8601String())),
        "isCompleted": isCompleted,
        "id": id,
        "ruleBookLink": rulebookLink,
        "description": description,
        "cup": cup
      };
}
