import 'package:flutter/material.dart';
import 'package:online_exam_app/model/answer.dart';

class AnswerMarkingSchemeCard extends StatelessWidget {
  final Answer answer;

  const AnswerMarkingSchemeCard({
    Key key,
    @required this.answer,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            gradient: answer.isCorrect
                ? LinearGradient(colors: [Color(0xFF17ead9), Colors.green])
                : LinearGradient(colors: [Colors.white, Colors.green]),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        height: 60,
        child: Row(
          children: <Widget>[
            Container(
              width: 10,
            ),
             Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor),
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Text(answer.alphabet,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
            Container(
              width: 10,
            ),
            Expanded(
              child: Text(
                answer.content,
                style: TextStyle(
                    color: answer.isCorrect ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
            Container(
              width: 10,
            ),
            answer.isCorrect
                ? Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                : Container(),
            Container(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
