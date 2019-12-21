import 'package:flutter/material.dart';

class Answer {
  final int id;
  final String alphabet;
  final String content;
  final int questionId;
  bool isSelected;

  Answer(
      {@required this.id,
      @required this.alphabet,
      @required this.content,
      @required this.isSelected,
      @required this.questionId});
}

List<Answer> religionList = <Answer>[
  Answer(
      id: 1,
      alphabet: 'A',
      content: 'Christian',
      isSelected: false,
      questionId: 1),
  Answer(
      id: 2,
      alphabet: 'B',
      content: 'Muslim',
      isSelected: false,
      questionId: 1),
  Answer(
      id: 3, alphabet: 'C', content: 'Hindu', isSelected: false, questionId: 1),
  Answer(
      id: 4,
      alphabet: 'D',
      content: 'Buddhism',
      isSelected: false,
      questionId: 1),
  Answer(
      id: 5,
      alphabet: 'E',
      content: 'Sabbath',
      isSelected: false,
      questionId: 1),
  Answer(
      id: 6, alphabet: 'F', content: 'Non', isSelected: false, questionId: 1),
];
List<Answer> ageList = <Answer>[
  Answer(
      id: 1,
      alphabet: 'A',
      content: '18 - 24',
      isSelected: false,
      questionId: 2),
  Answer(
      id: 2,
      alphabet: 'B',
      content: '25 - 34',
      isSelected: false,
      questionId: 2),
  Answer(
      id: 3,
      alphabet: 'C',
      content: '35 - 44',
      isSelected: false,
      questionId: 2),
  Answer(
      id: 4,
      alphabet: 'D',
      content: '45 - 54',
      isSelected: false,
      questionId: 2),

];

List<Answer> heightList = <Answer>[
  Answer(
      id: 1, alphabet: 'A', content: 'Tall', isSelected: false, questionId: 3),
  Answer(
      id: 2, alphabet: 'B', content: 'Short', isSelected: false, questionId: 3),
  Answer(
      id: 3,
      alphabet: 'C',
      content: 'Medium',
      isSelected: false,
      questionId: 3),
];

List<Answer> educationList = <Answer>[
  Answer(
      id: 1,
      alphabet: 'A',
      content: 'Primary',
      isSelected: false,
      questionId: 4),
  Answer(
      id: 2,
      alphabet: 'B',
      content: 'Secondary',
      isSelected: false,
      questionId: 4),
  Answer(
      id: 3,
      alphabet: 'C',
      content: 'A-Level',
      isSelected: false,
      questionId: 4),
  Answer(
      id: 4,
      alphabet: 'D',
      content: 'Diploma',
      isSelected: false,
      questionId: 4),
  Answer(
      id: 5,
      alphabet: 'E',
      content: 'Degree',
      isSelected: false,
      questionId: 4),
  Answer(
      id: 6,
      alphabet: 'F',
      content: 'Masters',
      isSelected: false,
      questionId: 4),
  Answer(
      id: 7, alphabet: 'G', content: 'PHD', isSelected: false, questionId: 4),
  Answer(
      id: 8, alphabet: 'E', content: 'Non', isSelected: false, questionId: 4),
];

List<Answer> jobsList = <Answer>[
  Answer(
      id: 1,
      alphabet: 'A',
      content: 'Unemployeed',
      isSelected: false,
      questionId: 5),
  Answer(
      id: 2,
      alphabet: 'B',
      content: 'Employeed',
      isSelected: false,
      questionId: 5),
  Answer(
      id: 3, alphabet: 'D', content: 'Both', isSelected: false, questionId: 5),
];

List<Answer> raceList = <Answer>[
  Answer(
      id: 1,
      alphabet: 'A',
      content: 'African',
      isSelected: false,
      questionId: 6),
  Answer(
      id: 2, alphabet: 'B', content: 'Asian', isSelected: false, questionId: 6),
  Answer(
      id: 3, alphabet: 'C', content: 'Arab', isSelected: false, questionId: 6),
  Answer(
      id: 4, alphabet: 'D', content: 'Latin', isSelected: false, questionId: 6),
  Answer(
      id: 5,
      alphabet: 'E',
      content: 'European',
      isSelected: false,
      questionId: 6)
];
