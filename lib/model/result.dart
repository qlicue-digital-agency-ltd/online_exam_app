import 'package:flutter/material.dart';

class Result {
  final int id;
  final int examId;
  final int studentId;
  final int score;
  final int postion;
  final int candidates;
  final String date;

  Result(
      {@required this.id,
      @required this.postion,
      @required this.candidates,
      @required this.examId,
      @required this.score,
      @required this.studentId,
      @required this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'examination_id': examId,
      'student_id': studentId,
      'code': postion,
      'score': score,
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
        studentId = map['student_id'],
        postion = map['postion'],
        score = map['score'],
        candidates = map['candidates'],
        date = map['date'];
}
