import 'package:flutter/material.dart';
import 'package:online_exam_app/model/question.dart';

class Examination {
  final int id;
  final String examNo;
  final int subjectId;
  final int teacherId;
  final int gradeId;
  final int duration;
  final String openingTime;
  final String closingTime;
  final List<Question> questions;

  Examination({
    @required this.id,
    @required this.examNo,
    @required this.subjectId,
    @required this.teacherId,
    @required this.gradeId,
    @required this.duration,
    @required this.openingTime,
    @required this.closingTime,
    @required this.questions,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'exam_no': examNo,
      'subject_id': subjectId,
      'teacher_id': teacherId,
      'grade_id': gradeId,
      'duration': duration,
      'opening_time': openingTime,
      'closing_time': closingTime,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Examination.fromMap(Map<String, dynamic> map)
      : assert(map[id] != null),
        id = map['id'],
        examNo = map['exam_no'],
        subjectId = map['subject_id'],
        teacherId = map['teacher_id'],
        gradeId = map['grade_id'],
        duration = map['duration'],
        openingTime = map['opening_time'],
        closingTime = map['closing_time'],
        questions = map['questions'] != null
            ? (map['questions'] as List)
                .map((i) => Question.fromMap(i))
                .toList()
            : null;
}
