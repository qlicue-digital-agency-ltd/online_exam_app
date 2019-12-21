import 'package:flutter/material.dart';

class Subject {
  final String icon;
  final String title;

  Subject({@required this.icon, @required this.title});
}

List<Subject> subjectList = <Subject>[
  Subject(icon: 'assets/icon/books.png', title: 'ENGLISH'),
  Subject(icon: 'assets/icon/abacus.png', title: 'MATHEMATICS'),
  Subject(icon: 'assets/icon/chemistry.png', title: 'SCIENCE')
];
