import 'package:flutter/material.dart';
import 'package:online_exam_app/model/profile.dart';

class User {
  int id;
  String phone;
  String password;
  Profile profile;

  User({@required this.id, @required this.phone, @required this.password});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'phone': phone};
    if (id != null) {
      map['id'] = id;
      map['phone'] = phone;
      map['password'] = password;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['phone'] != null),
        id = map['id'],
        phone = map['phone'].toString(),
        profile =
            map['profile'] != null ? Profile.fromMap(map['profile']) : null;
}
