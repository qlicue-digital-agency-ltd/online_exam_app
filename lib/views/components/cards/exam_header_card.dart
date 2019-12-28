import 'package:flutter/material.dart';

class ExamHeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            'Question: 50',
            style: TextStyle(fontSize: 15),
          )),
          Expanded(
              child: Text(
            '02:00 hrs',
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 15),
          ))
        ],
      ),
    );
  }
}
