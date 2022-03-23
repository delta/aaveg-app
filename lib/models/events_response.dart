// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

EventsResponse eventsResponseFromJson(String str) =>
    EventsResponse.fromJson(json.decode(str));

String eventsResponseToJson(EventsResponse data) => json.encode(data.toJson());

class EventsResponse {
  EventsResponse({
    this.title,
    this.eventsByCluster,
    this.eventsByCup,
  });

  String? title;
  List<EventsByC>? eventsByCluster;
  List<EventsByC>? eventsByCup;

  factory EventsResponse.fromJson(Map<String, dynamic> json) => EventsResponse(
        title: json['title'] == null ? null : json['title'],
        eventsByCluster: json['eventsByCluster'] == null
            ? null
            : List<EventsByC>.from(
                json['eventsByCluster'].map((x) => EventsByC.fromJson(x))),
        eventsByCup: json['eventsByCup'] == null
            ? null
            : List<EventsByC>.from(
                json['eventsByCup'].map((x) => EventsByC.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'title': title == null ? null : title,
        'eventsByCluster': eventsByCluster == null
            ? null
            : List<dynamic>.from(eventsByCluster!.map((x) => x.toJson())),
        'eventsByCup': eventsByCup == null
            ? null
            : List<dynamic>.from(eventsByCup!.map((x) => x.toJson())),
      };
}

class EventsByC {
  EventsByC({
    required this.events,
  });

  List<Event>? events;

  factory EventsByC.fromJson(Map<String, dynamic> json) => EventsByC(
        events: json['events'] == null
            ? null
            : List<Event>.from(json['events'].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'events': events == null
            ? null
            : List<dynamic>.from(events!.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    required this.name,
    required this.cluster,
    required this.points,
    required this.places,
    required this.description,
    required this.rules,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.formLink,
    required this.eventLink,
    required this.imageLink,
    required this.cup,
  });

  String name;
  List<Cup> cluster;
  List<int>? points;
  int places;
  String description;
  String rules;
  String startTime;
  String endTime;
  String date;
  String formLink;
  String eventLink;
  String imageLink;
  List<Cup> cup;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        name: json['name'] == null ? null : json['name'],
        cluster: json['cluster'] == null
            ? List<Cup>.filled(1, Cup(name: 'Arts'))
            : List<Cup>.from(json['cluster'].map((x) => Cup.fromJson(x))),
        points: json['points'] == null
            ? null
            : List<int>.from(json['points'].map((x) => x)),
        places: json['places'] == null ? null : json['places'],
        description: json['description'] == null ? null : json['description'],
        rules: json['rules'] == null ? null : json['rules'],
        startTime: json['startTime'] == null ? null : json['startTime'],
        endTime: json['endTime'] == null ? null : json['endTime'],
        date: json['date'] == null ? null : json['date'],
        formLink: json['formLink'] == null ? null : json['formLink'],
        eventLink: json['eventLink'] == null ? null : json['eventLink'],
        imageLink: json['imageLink'] == null ? null : json['imageLink'],
        cup: json['cup'] == null
            ? List<Cup>.filled(1, Cup(name: 'Culturals'))
            : List<Cup>.from(json['cup'].map((x) => Cup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'cluster': List<dynamic>.from(cluster.map((x) => x.toJson())),
        'points': List<dynamic>.from(points!.map((x) => x)),
        'places': places,
        'description': description,
        'rules': rules,
        'startTime': startTime,
        'endTime': endTime,
        'date': date,
        'formLink': formLink,
        'eventLink': eventLink,
        'imageLink': imageLink,
        'cup': List<dynamic>.from(cup.map((x) => x.toJson())),
      };
}

class Cup {
  Cup({
    required this.name,
  });

  String name;

  factory Cup.fromJson(Map<String, dynamic> json) => Cup(
        name: json['name'] == null ? null : json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
