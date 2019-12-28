import 'package:flutter/material.dart';

class Subject {
  final String icon;
  final String title;
  final Color backgroundColor;

  Subject(
      {@required this.icon,
      @required this.title,
      @required this.backgroundColor});
}

List<Subject> subjectList = <Subject>[
  Subject(
      icon: 'assets/icon/books.png',
      title: 'ENGLISH',
      backgroundColor: Colors.red),
  Subject(
      icon: 'assets/icon/abacus.png',
      title: 'MATHEMATICS',
      backgroundColor: Colors.orange),
  Subject(
      icon: 'assets/icon/chemistry.png',
      title: 'SCIENCE',
      backgroundColor: Colors.pink),
  Subject(
      icon: 'assets/icon/books.png', title: 'ENGLISH', backgroundColor: Colors.indigo),
  Subject(
      icon: 'assets/icon/abacus.png',
      title: 'MATHEMATICS',
      backgroundColor: Colors.blue),
  Subject(
      icon: 'assets/icon/chemistry.png',
      title: 'SCIENCE',
      backgroundColor: Colors.cyan)
];
