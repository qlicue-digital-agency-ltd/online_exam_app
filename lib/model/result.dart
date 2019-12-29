import 'package:flutter/material.dart';

class Result {
  final int id;
  final int examId;
  final int subjectId;
  final int postion;
  final int candidates;
  final String date;

  Result(
      {@required this.id,
      @required this.postion,
      @required this.candidates,
      @required this.examId,
      @required this.subjectId,
      @required this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'examination_id': examId,
      'subject_id': subjectId,
      'code': postion,
      'candidates': candidates,
      'date': date,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Result.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        id = map['id'],
        examId = map['examination_id'],
        subjectId = map['subject_id'],
        postion = map['postion'],
        candidates = map['candidates'],
        date = map['date'];
}
