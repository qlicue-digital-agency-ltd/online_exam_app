import 'package:flutter/material.dart';
import 'package:online_exam_app/model/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({Key key, @required this.question}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: 'Qn\t' + question.number.toString() + '. \t',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                        text: '\n' + question.content,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal))
                  ])),
            ),
          ],
        ),
        question.image != null
            ? Container(
                padding: EdgeInsets.all(10),
                child: Image.asset('assets/icon/abacus.png'),
              )
            : Container(),
      ],
    );
  }
}
