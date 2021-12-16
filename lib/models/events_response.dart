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

  String title;
  List<EventsByC> eventsByCluster;
  List<EventsByC> eventsByCup;

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
            : List<dynamic>.from(eventsByCluster.map((x) => x.toJson())),
        'eventsByCup': eventsByCup == null
            ? null
            : List<dynamic>.from(eventsByCup.map((x) => x.toJson())),
      };
}

class EventsByC {
  EventsByC({
    this.events,
  });

  List<Event> events;

  factory EventsByC.fromJson(Map<String, dynamic> json) => EventsByC(
        events: json['events'] == null
            ? null
            : List<Event>.from(json['events'].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'events': events == null
            ? null
            : List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    this.name,
    this.cluster,
    this.points,
    this.places,
    this.description,
    this.rules,
    this.startTime,
    this.endTime,
    this.date,
    this.formLink,
    this.eventLink,
    this.imageLink,
    this.cup,
  });

  String name;
  List<Cup> cluster;
  List<int> points;
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
        'name': name == null ? null : name,
        'cluster': cluster == null
            ? null
            : List<dynamic>.from(cluster.map((x) => x.toJson())),
        'points':
            points == null ? null : List<dynamic>.from(points.map((x) => x)),
        'places': places == null ? null : places,
        'description': description,
        'rules': rules == null ? null : rules,
        'startTime': startTime == null ? null : startTime,
        'endTime': endTime == null ? null : endTime,
        'date': date == null ? null : date,
        'formLink': formLink == null ? null : formLink,
        'eventLink': eventLink == null ? null : eventLink,
        'imageLink': imageLink == null ? null : imageLink,
        'cup':
            cup == null ? null : List<dynamic>.from(cup.map((x) => x.toJson())),
      };
}

class Cup {
  Cup({
    this.name,
  });

  String name;

  factory Cup.fromJson(Map<String, dynamic> json) => Cup(
        name: json['name'] == null ? null : json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name == null ? null : name,
      };
}
