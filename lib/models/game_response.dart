import 'dart:convert';

GameResponse gameResponseFromJson(String str) =>
    GameResponse.fromJson(json.decode(str));

String gameResponseToJson(GameResponse data) => json.encode(data.toJson());

class GameResponse {
  GameResponse({
    this.game,
  });

  List<Game>? game;

  factory GameResponse.fromJson(Map<String, dynamic> json) => GameResponse(
        game: json['game'] == null
            ? null
            : List<Game>.from(json['game'].map(Game.fromJson)),
      );

  Map<String, dynamic> toJson() => {
        'game': game == null
            ? null
            : List<dynamic>.from(game!.map((x) => x.toJson())),
      };
}

class Game {
  Game({
    required this.id,
    required this.rollnumber,
    required this.clan,
    required this.distance,
    required this.kills,
    required this.v,
  });

  String id;
  String rollnumber;
  String clan;
  String distance;
  String kills;
  int v;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json['_id'] == null ? null : json['_id'],
        rollnumber: json['rollnumber'] == null ? null : json['rollnumber'],
        clan: json['clan'] == null ? null : json['clan'],
        distance: json['distance'] == null ? null : json['distance'],
        kills: json['kills'] == null ? null : json['kills'],
        v: json['__v'] == null ? null : json['__v'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'rollnumber': rollnumber,
        'clan': clan,
        'distance': distance,
        'kills': kills,
        '__v': v,
      };
}
