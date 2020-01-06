import 'package:flutter/material.dart';

class Student {
  final int id;
  final String name;
  final String image;
  final String gender;
  final String birthday;
  final String schoolName;
  final int gradeId;
  final int districtId;
  final int regionId;
  final int userId;

  Student({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.gender,
    @required this.birthday,
    @required this.schoolName,
    @required this.gradeId,
    @required this.districtId,
    @required this.regionId,
    @required this.userId,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'image': image,
      'gender': gender,
      'birthday': birthday,
      'school_name': schoolName,
      'grade_id': gradeId,
      'district_id': districtId,
      'region_id': regionId,
      'user_id': userId,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Student.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['name'] != null),
        id = map['id'],
        name = map['name'],
        image = map['image'],
        gender = map['gender'],
        birthday = map['birthday'],
        schoolName = map['school_name'],
        gradeId = map['grade_id'],
        districtId = map['district_id'],
        regionId = map['region_id'],
        userId = map['user_id'];
}
