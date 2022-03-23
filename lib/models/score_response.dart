import 'dart:convert';

ScoresResponse scoresResponseFromJson(String str) =>
    ScoresResponse.fromJson(json.decode(str));

String scoresResponseToJson(ScoresResponse data) => json.encode(data.toJson());

class ScoresResponse {
  ScoresResponse({
    this.standings,
    this.total,
    this.eventsScore,
  });

  Standings? standings;
  Clans? total;
  EventsScore? eventsScore;

  factory ScoresResponse.fromJson(Map<String, dynamic> json) => ScoresResponse(
        standings: json['standings'] == null
            ? null
            : Standings.fromJson(json['standings']),
        total: json['total'] == null ? null : Clans.fromJson(json['total']),
        eventsScore: json['events_score'] == null
            ? null
            : EventsScore?.fromJson(json['events_score']),
      );

  Map<String, dynamic> toJson() => {
        'standings': standings == null ? null : standings!.toJson(),
        'total': total == null ? null : total!.toJson(),
        'events_score': eventsScore == null ? null : eventsScore!.toJson(),
      };
}

class EventsScore {
  EventsScore({
    required this.culturals,
    required this.spectrum,
  });

  List<Clans>? culturals;
  List<Clans>? spectrum;

  factory EventsScore.fromJson(Map<String, dynamic> json) => EventsScore(
        culturals: json['culturals'] == null
            ? null
            : List<Clans>.from(json['culturals'].map((x) => Clans.fromJson(x))),
        spectrum: json['spectrum'] == null
            ? null
            : List<Clans>.from(json['spectrum'].map((x) => Clans.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'culturals': culturals == null
            ? null
            : List<dynamic>.from(culturals!.map((x) => x.toJson())),
        'spectrum': spectrum == null
            ? null
            : List<dynamic>.from(spectrum!.map((x) => x.toJson())),
      };
}

class Clans {
  Clans({
    this.eventName,
    this.aakash,
    this.vayu,
    this.agni,
    this.prithvi,
    this.jal,
  });

  String? eventName;
  int? aakash;
  int? vayu;
  int? agni;
  int? prithvi;
  int? jal;

  factory Clans.fromJson(Map<String, dynamic> json) => Clans(
        eventName: json['event_name'],
        aakash: json['Aakash'],
        vayu: json['Vayu'],
        agni: json['Agni'],
        prithvi: json['Prithvi'],
        jal: json['Jal'],
      );

  Map<String, dynamic> toJson() => {
        'event_name': eventName,
        'Aakash': aakash,
        'Vayu': vayu,
        'Agni': agni,
        'Prithvi': prithvi,
        'Jal': jal,
      };
}

class Standings {
  Standings({
    required this.culturals,
    required this.spectrum,
  });

  Clans culturals;
  Clans spectrum;

  factory Standings.fromJson(Map<String, dynamic> json) {
    if (json['culturals'] == {}) {
      json['culturals'] = {
        'Aakash': 0,
        'Vayu': 0,
        'Prithvi': 0,
        'Agni': 0,
        'Jal': 0
      };
    }
    if (json['spectrum'] == {}) {
      json['spectrum'] = {
        'Aakash': 0,
        'Vayu': 0,
        'Prithvi': 0,
        'Agni': 0,
        'Jal': 0
      };
    }
    return Standings(
      culturals: Clans.fromJson(json['culturals']),
      spectrum: Clans.fromJson(json['spectrum']),
    );
  }

  Map<String, dynamic> toJson() => {
        'culturals': culturals.toJson(),
        'spectrum': spectrum.toJson(),
      };
}
