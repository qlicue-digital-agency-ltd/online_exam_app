import 'package:flutter/material.dart';

class Result {
  final int id;
  final int examId;
  final int studentId;
  final int score;
  final int position;
  final int candidates;
  final String date;

  Result(
      {@required this.id,
      @required this.position,
      @required this.candidates,
      @required this.examId,
      @required this.score,
      @required this.studentId,
      @required this.date});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'examination_id': examId,
      'student_id': studentId,
      'position': position,
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
        position = map['position'],
        score = map['score'],
        candidates = map['candidates'],
        date = map['created_at'].toString();
}
