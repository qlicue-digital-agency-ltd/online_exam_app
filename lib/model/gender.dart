import 'package:flutter/material.dart';

class Gender {
  final int id;
  final String name;

  Gender({
    @required this.id,
    @required this.name,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Gender.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        id = map['id'],
        name = map['name'];
}

List<Gender> genders = <Gender>[
  Gender(id: 1, name: 'Male'),
  Gender(id: 1, name: 'Female')
];
