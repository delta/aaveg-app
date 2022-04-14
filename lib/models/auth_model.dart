import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.jwt,
    this.message,
  });

  String? jwt;
  String? message;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        jwt: json["jwt"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "message": message,
      };
}
