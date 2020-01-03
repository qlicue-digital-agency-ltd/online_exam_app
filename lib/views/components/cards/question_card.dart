import 'package:flutter/material.dart';
import 'package:online_exam_app/model/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({Key key, @required this.question}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: ExactAssetImage('assets/images/background.jpg'),
        fit: BoxFit.cover,
      )),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.white)
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: 'Qn\t' + question.number.toString() + '. \t',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                        TextSpan(
                            text: '\n' + question.content,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                               fontFamily: 'Indie-Flower',
                              fontSize: 25,
                            ))
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
        ),
      ),
    );
  }
}
