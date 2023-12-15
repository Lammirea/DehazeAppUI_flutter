import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Users{
  int? id;
  final String username;
  final String email;
  final bool is_active;
  final String password;

  Users({
    this.id,
    required this.username,
    required this.email,
    required this.is_active,
    required this.password,
    });


  factory Users.fromJson(Map<String,dynamic> json) => Users(
    id: json['id'],
    username: json['username'],
    email: json['email'],
    is_active: json['is_active'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() =>{
    "id": id,
    "username": username,
    "email": email,
    "is_active": is_active,
    "password": password,
  };
}