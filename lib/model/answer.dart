import 'package:flutter/material.dart';

class Answer {
  final int id;
  final String alphabet;
  final String content;
  final int questionId;
  final bool isCorrect;
  bool isSelected;

  Answer({
    @required this.id,
    @required this.alphabet,
    @required this.content,
    @required this.questionId,
    @required this.isCorrect,
    this.isSelected = false,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'content': content,
      'alphabet': alphabet,
      'is_correct': isCorrect,
      'question_id': questionId,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Answer.fromMap(Map<String, dynamic> map)
      : assert(map[id] != null),
        id = map['id'],
        content = map['content'],
        alphabet = map['alphabet'],
        isCorrect = map['is_correct'],
        questionId = map['question_id'];
}
