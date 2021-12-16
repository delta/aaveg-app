import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.message = '',
    this.userId = '',
    this.clan = '',
    this.apiToken = '',
    this.rollnumber = '',
  });

  String message;
  String userId;
  String clan;
  String apiToken;
  String rollnumber;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'],
        userId: json['user_id'],
        clan: json['clan'],
        apiToken: json['APIToken'],
        rollnumber: json['rollnumber'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user_id': userId,
        'clan': clan,
        'APIToken': apiToken,
        'rollnumber': rollnumber,
      };
}
