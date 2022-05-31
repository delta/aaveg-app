// import 'dart:convert';

// AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

// String authModelToJson(AuthModel data) => json.encode(data.toJson());

// class AuthModel {
//   AuthModel({
//     this.jwt,
//     this.message,
//   });

//   String? jwt;
//   String? message;

//   factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
//         jwt: json["jwt"],
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "jwt": jwt,
//         "message": message,
//       };
// }
// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.jwt,
    this.userDetails,
    this.message,
  });

  String? jwt;
  UserDetails? userDetails;
  String? message;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        jwt: json["jwt"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "userDetails": userDetails!.toJson(),
        "message": message,
      };
}

class UserDetails {
  UserDetails({
    this.name,
    this.squad,
  });

  String? name;
  String? squad;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: json["name"],
        squad: json["squad"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "squad": squad,
      };
}
