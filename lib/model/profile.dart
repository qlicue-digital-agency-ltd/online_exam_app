import 'package:flutter/material.dart';

class Profile {
  final int id;
  final String name;
  final String image;
  final String gender;
  final String email;

  final int userId;

  Profile({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.gender,
    @required this.email,
    @required this.userId,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'image': image,
      'gender': gender,
      'email': email,
      'user_id': userId,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Profile.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['name'] != null),
        id = map['id'],
        name = map['name'],
        image = map['image'],
        gender = map['gender'],
        email = map['email'],
        userId = map['user_id'];
}
