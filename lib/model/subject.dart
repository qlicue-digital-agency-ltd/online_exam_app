import 'package:flutter/material.dart';
import 'package:online_exam_app/model/examination.dart';

class Subject {
  final int id;
  final String code;
  final String name;
  List<Examination> examinations;

  Subject({
    @required this.id,
    @required this.code,
    @required this.name,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'code': code,
      'name': name,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Subject.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['name'] != null),
        assert(map['code'] != null),
        id = map['id'],
        name = map['name'],
        code = map['code'],
        examinations = map['examinations'] != null
            ? (map['examinations'] as List)
                .map((i) => Examination.fromMap(i))
                .toList()
            : null;
}
