// To parse this JSON data, do
//
//     final signUpUserModel = signUpUserModelFromMap(jsonString);

import 'dart:convert';

SignUpUserModel signUpUserModelFromMap(String str) =>
    SignUpUserModel.fromMap(json.decode(str));

String signUpUserModelToMap(SignUpUserModel data) => json.encode(data.toMap());

class SignUpUserModel {
  final String name;
  final String email;
  final String password;

  SignUpUserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignUpUserModel.fromMap(Map<String, dynamic> json) => SignUpUserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
