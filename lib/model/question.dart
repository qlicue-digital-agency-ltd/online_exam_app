import 'package:flutter/material.dart';
import 'package:online_exam_app/model/answer.dart';

class Question {
  final int id;
  final String content;
  final int examId;
  final List<Answer> answers;

  Question(
      {@required this.id,
      @required this.content,
      @required this.examId,
      @required this.answers});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'content': content,
      'examination_id': examId,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Question.fromMap(Map<String, dynamic> map)
      : assert(map[id] != null),
        id = map['id'],
        content = map['content'],
        examId = map['examination_id'],
        answers = map['answers'] != null
            ? (map['answers'] as List).map((i) => Answer.fromMap(i)).toList()
            : null;
}
