import 'package:flutter/material.dart';

class Grade {
  final int id;
  final String name;

  Grade({
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

  Grade.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        id = map['id'],
        name = map['name'];
}
