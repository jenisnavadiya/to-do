// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserModel {
  UserModel({
    @required this.fullname,
    @required this.email,
    @required this.password,
  });

  final String? fullname;
  final String? email;
  final String? password;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        fullname: json["fullname"] == null ? null : json["fullname"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toMap() => {
        "fullname": fullname == null ? null : fullname,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}
