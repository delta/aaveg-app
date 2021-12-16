import 'dart:convert';

GameResponse gameResponseFromJson(String str) =>
    GameResponse.fromJson(json.decode(str));

String gameResponseToJson(GameResponse data) => json.encode(data.toJson());

class GameResponse {
  GameResponse({
    this.game,
  });

  List<Game> game;

  factory GameResponse.fromJson(Map<String, dynamic> json) => GameResponse(
        game: json['game'] == null
            ? null
            : List<Game>.from(json['game'].map((x) => Game.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'game': game == null
            ? null
            : List<dynamic>.from(game.map((x) => x.toJson())),
      };
}

class Game {
  Game({
    this.id,
    this.rollnumber,
    this.clan,
    this.distance,
    this.kills,
    this.v,
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
        '_id': id == null ? null : id,
        'rollnumber': rollnumber == null ? null : rollnumber,
        'clan': clan == null ? null : clan,
        'distance': distance == null ? null : distance,
        'kills': kills == null ? null : kills,
        '__v': v == null ? null : v,
      };
}
