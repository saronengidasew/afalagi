import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';


@immutable
class Story extends Equatable {
  Story(
      {this.id,
      this.storypicturepath,
      this.storyid,
      this.userid,
      this.story});

  final String id;
  final String storypicturepath;
  final String storyid;
  final String userid;
  final String story;

  @override
  List<Object> get props => [id, storypicturepath,  storyid, userid, story];

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['_id'],
      storypicturepath: json['Storyname'],
      storyid: json['age'],
      story: json['password'],

    );
  }

  @override
  String toString() => 'Story { id: $id, age: $age, height: $height, reward: $reward}';
}
