import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';


@immutable
class User extends Equatable {
  User(
      {this.id,
      @required this.name,
      @required this.age,
      this.password,
      this.email,
      this.height,
      this.reward,
      this.location});

  final String id;
  final String name;
  final String password;
  final int age;
  final String email;
  final int height;
  final int reward;
  final String location;

  @override
  List<Object> get props => [id, name,  age, password, email,height,];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['username'],
      age: json['age'],
      password: json['password'],
      email: json['email'],
      height:json['height'],
      reward:json['reward'],
      location:json['location'],

    );
  }

  @override
  String toString() => 'User { id: $id, age: $age, height: $height, reward: $reward}';
}
