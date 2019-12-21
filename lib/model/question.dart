import 'package:flutter/material.dart';

class Question {
  final int id;

  final String content;
  final int examId;

  Question({
    @required this.id,
    @required this.content,
    @required this.examId,
  });
}

List<Question> questionList = <Question>[
  Question(
      id: 1, content: 'Of what religion to you want them to be?', examId: 1),
  Question(
      id: 2,
      content:
          'What is your preferred age range for a person you would like to meet?',
      examId: 1),
  Question(
      id: 3, content: 'Tell us of the height range you prefer?', examId: 1),
  Question(
      id: 4,
      content:
          'What is the least education level do you want this person to have?',
      examId: 1),
  Question(
      id: 5, content: "Do you what a working class person or not ?", examId: 1),
  Question(
      id: 6,
      content: "Last but not least, of what race should the person be?",
      examId: 1)
];
