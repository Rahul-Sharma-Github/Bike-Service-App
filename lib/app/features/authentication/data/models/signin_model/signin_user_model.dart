// To parse this JSON data, do
//
//     final signInUserModel = signInUserModelFromMap(jsonString);

import 'dart:convert';

SignInUserModel signInUserModelFromMap(String str) =>
    SignInUserModel.fromMap(json.decode(str));

String signInUserModelToMap(SignInUserModel data) => json.encode(data.toMap());

class SignInUserModel {
  final String email;
  final String password;

  SignInUserModel({
    required this.email,
    required this.password,
  });

  factory SignInUserModel.fromMap(Map<String, dynamic> json) => SignInUserModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
