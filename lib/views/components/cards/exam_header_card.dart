import 'package:flutter/material.dart';
import 'package:online_exam_app/model/examination.dart';

class ExamHeaderCard extends StatelessWidget {
  final Examination examination;

  const ExamHeaderCard({Key key, @required this.examination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            'Question: \t' + examination.questions.length.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          )),
          Expanded(
              child: Text(
            '0' + examination.duration.toString() + ':00 hrs',
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ))
        ],
      ),
    );
  }
}
