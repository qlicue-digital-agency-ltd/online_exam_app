import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';

class ResultBoardScren extends StatelessWidget {
  final MainModel model;

  const ResultBoardScren({Key key, @required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Image.asset('assets/icon/trophy.png'),
            SizedBox(
              height: 10,
            ),
            Text('Congrats!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Text(model.totalScore.toString() + '% Score',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10,
            ),
            Text('Examination completed successfully.',
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            // RichText(
            //   textAlign: TextAlign.center,
            //   text: TextSpan(
            //     text: 'You attempted 40 questions and from that ',
            //     style:
            //         TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            //     children: <TextSpan>[
            //       TextSpan(
            //           text: '35 answers',
            //           style: TextStyle(color: Colors.green)),
            //       TextSpan(text: ' are correct'),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Examination Date:\t ' + model.currentExamination.openingTime,
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Examination Number:\t ' + model.currentExamination.examNo,
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
